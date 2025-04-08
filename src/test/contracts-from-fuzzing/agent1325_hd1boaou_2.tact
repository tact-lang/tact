struct Nested {
    nestedInt: Int;
    nestedBool: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            nestedInt: 5,
            nestedBool: true
        };
    }

    receive() {
        self.nested = Nested{
            nestedInt: self.nested.nestedInt + 1,
            nestedBool: self.nested.nestedBool
        };
    }
}