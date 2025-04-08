struct Nested {
    field1: Int;
    field2: Bool;
    field3: Address;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            field1: 10,
            field2: false,
            field3: myAddress(),
        };
    }
}