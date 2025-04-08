struct Nested {
    flag: Bool;
    number: Int as uint32;
}

contract TestContract {
    nestedData: Nested = Nested{ flag: true, number: 123 };

    init() {
        self.nestedData = Nested{ flag: false, number: 42 };
    }

    receive() {
        // dummy
    }
}