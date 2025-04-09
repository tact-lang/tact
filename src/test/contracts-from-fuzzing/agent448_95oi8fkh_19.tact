struct AddressTest {
    a: Address;
    b: Address?;
}

contract AddressTestContract {
    data: AddressTest;

    init() {
        self.data = AddressTest{
            a: myAddress(),
            b: null,
        };
    }

    receive() {}
}