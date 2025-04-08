struct Nested1 {
    a: Int;
}

contract Test {
    f: Nested1;

    init() {
        self.f = Nested1{a: 1};
    }
}
