struct OptionalSizedInts {
    a: Int?;
    b: Int? as uint4;
    c: Int? as uint8;
}

contract OptSizes {
    s: OptionalSizedInts;
    init() {
        self.s = OptionalSizedInts{ a:null, b:null, c:3 };
    }
}