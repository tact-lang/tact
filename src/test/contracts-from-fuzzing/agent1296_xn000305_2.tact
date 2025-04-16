struct Nested {
    a: Int;
    b: Bool;
    c: Address;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            a: 10,
            b: true,
            c: myAddress(),
        };
    }
}
