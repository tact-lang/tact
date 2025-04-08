struct SimpleInner { x: Int; }

contract OptionalPrimitiveAndStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: SimpleInner?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}