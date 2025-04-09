struct HasManyAddresses {
    a1: Address;
    a2: Address;
    a3: Address;
    a4: Address;
    a5: Address;
}

contract ManyAddresses {
    data: HasManyAddresses;

    init() {
        self.data = HasManyAddresses{
            a1: myAddress(), a2: myAddress(), a3: myAddress(), a4: myAddress(), a5: myAddress()
        };
    }
}
