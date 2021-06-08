## Oyster card challenge

### Planning

#### 4: Add the balance
```
In order to use public transport
As a customer
I want money on my card
```

- Class: Oystercard
- Variable: @balance (@balance = 0)

#### 5: Enable top-up functionality
```
In order to keep using public transport
As a customer
I want to add money to my card
```

- Class: Oystercard
- Method: top_up(money)

#### 6: Enforce maximum balance
```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```

- Class: Oystercard
- Method: top_up(money)
- Constant: MAX_LIMIT = 90

#### 7: Deduct the money
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

- Class: Oystercard
- Method: deduct(money)

#### 8: Add touch in/out support
```
In order to get through the barriers
As a customer
I need to touch in and out
```

- Class: Oystercard
- Variable: @in_journey (initialize with false state)
- Method: touch_in, touch_out, in_journey?

#### 9: Checking the minimum balance on touch in
```
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey
```

- Class: Oystercard
- Constant: MIN_LIMIT
- Method: touch_in, minimum_balance

#### 10: Charging for the journey
```
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete
```

- Class: Oystercard
- Constant: FARE
- Method: touch_out, deduct(FARE)

#### 11: Saving the entry station
```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
#### 12: Adding the journey history
```
In order to know where I have been
As a customer
I want to see to all my previous trips
```
#### 13: Creating the station class
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```
#### 14: Handing a journey without a touch out
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```
#### 15: Extracting the journey log out of the Oystercard


#### 16: Calculating the fair between zones
```
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
