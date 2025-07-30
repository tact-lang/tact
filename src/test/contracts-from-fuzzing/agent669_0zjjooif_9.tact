struct InOrder {
    a: Int as uint8;
    b: Int;
    c: Bool;
    d: String;
}

contract SerializationOrder {
    val: InOrder;

    init() {
        self.val = InOrder{ a: 255, b: 123456, c: true, d: "test" };
    }
}