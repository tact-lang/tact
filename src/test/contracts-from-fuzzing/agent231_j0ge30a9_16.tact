struct InnerOptStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalStructWithOptionals {
    s: InnerOptStruct?;

    init() {
        self.s = InnerOptStruct{ x: null, y: false };
    }
}