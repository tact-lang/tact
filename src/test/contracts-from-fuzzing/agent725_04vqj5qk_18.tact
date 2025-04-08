struct SInner {
    text: String;
    num: Int;
}

contract OptionalPrimitivesAndStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: SInner?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}