import requests

def check_application_health(url: str):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            print(f"Application is UP. Status code: {response.status_code}")
        else:
            print(f"Application is DOWN. Status code: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"Application is DOWN. Error: {e}")


application_url = 'https://www.google.co.in/'
check_application_health(application_url)

