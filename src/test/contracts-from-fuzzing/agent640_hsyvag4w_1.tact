struct Nested1 {
    a: Int;
    b: Bool?;
}

contract TestFuzz {
    data: Nested1;

    init() {
        self.data = Nested1{
            a: 42,
            b: true,
        };
    }
}