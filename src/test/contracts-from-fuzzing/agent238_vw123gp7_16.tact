struct AddressStuff {
    who: Address;
    target: Address?;
    other: Address;
}

contract AddressTest {
    data: AddressStuff;

    init() {
        self.data = AddressStuff{
            who: myAddress(),
            target: null,
            other: myAddress()
        };
    }
}