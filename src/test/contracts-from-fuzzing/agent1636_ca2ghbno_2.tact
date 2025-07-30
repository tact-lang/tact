struct Nested {
    val1: Int;
    val2: Bool;
    val3: Address;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{val1: 0, val2: false, val3: myAddress()};
    }
}
