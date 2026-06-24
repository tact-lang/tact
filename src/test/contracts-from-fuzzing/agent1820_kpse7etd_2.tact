struct Nested {
    x: Int;
    y: Bool;
    z: Address;
}

contract TestContract {
    nested: Nested;
    init() {
        self.nested = Nested{
            x: 5,
            y: false,
            z: myAddress(),
        };
    }
}