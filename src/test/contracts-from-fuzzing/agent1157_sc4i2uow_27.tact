struct S {
    a: Int;
    b: Bool;
}

contract NestedOptStructTest {
    data: S?;

    init() {
        self.data = S{ a: 99, b: false };
    }
}