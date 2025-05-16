struct Nested1 {
    a: Int;
    b: Bool;
}

contract DeepNestContract {
    nested: Nested1;

    init() {
        self.nested = Nested1{
            a: 10,
            b: true,
        };
    }
}
