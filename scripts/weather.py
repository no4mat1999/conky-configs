import json
import requests

api_token = 'insert api key'
api_city = '3527164'
api_units = 'metric'
api_lang = 'es'
api_url_base = 'https://api.openweathermap.org/data/2.5/weather'

try:
	response = requests.get(api_url_base, params={'id':api_city, 'appid':api_token, 'units':api_units, 'lang':api_lang})
	values = response.json()

	result = str(values.get('main')['temp']) + ' °C'

	icon_id = values.get('weather')[0]['id']
	icon_variant = values.get('weather')[0]['icon']
	unicode_icon = ''
	if (icon_id >= 200 and icon_id <= 232):
		unicode_icon = u'\ue31c'
	if (icon_id >= 300 and icon_id <= 321):
		unicode_icon = u'\ue319'
	if (icon_id >= 500 and icon_id <=504):
		unicode_icon = u'\ue308'
	if (icon_id >= 520 and icon_id <=531):
		unicode_icon = u'\ue318'
	if (icon_id >=600 and icon_id <= 622):
		unicode_icon = u'\ue36f'
	if (icon_id >=701 and icon_id <= 781):
		unicode_icon = u'\ue31e'
	if (icon_id == 800):
		if (icon_variant == '01d'):
			unicode_icon = u'\ue30d'
		if (icon_variant == '01n'):
			unicode_icon = u'\ue32b'
	if (icon_id == 801):
		if (icon_variant == '02d'):
			unicode_icon = u'\ue302'
		if (icon_variant == '02n'):
			unicode_icon = u'\ue37e'
	if (icon_id == 802):
		unicode_icon = u'\ue33d'
	if (icon_id >= 803 and icon_id <= 804):
		unicode_icon = u'\ue312'

	print (unicode_icon + '  ' + result)
except:
	print ('N/A')
