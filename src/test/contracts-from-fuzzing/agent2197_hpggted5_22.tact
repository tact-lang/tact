struct FieldOrder {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
}

contract OrderTest {
    data: FieldOrder;

    init() {
        self.data = FieldOrder{ a:1, b:2, c:3 };
    }
}