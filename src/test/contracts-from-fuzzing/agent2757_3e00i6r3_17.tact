struct NestedStruct {
    data: Int;
}

contract MultiOptionals {
    a: Int?;
    b: Bool?;
    c: NestedStruct?;
    d: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}