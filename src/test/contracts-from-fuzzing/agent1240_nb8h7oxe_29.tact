struct InOrder {
    a: Int;
    b: Int;
    c: Int;
}

contract OrderTest {
    data: InOrder;
    init() {
        self.data = InOrder{ a:1, b:2, c:3 };
    }
}