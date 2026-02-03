# List of months
months = ["January","February","March","April","May","June","July","August",
          "September","October","November","December"]

#My birth month
birth_month = "June"

for month in months:
    if month == birth_month:
        print("My birthday is in", month)
    else: 
        print("I was not born in", month)