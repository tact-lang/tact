struct InnerStruct {
    a: Int;
    b: Bool?;
}

contract NestedFields {
    f1: InnerStruct;
    f2: InnerStruct;
    f3: Int;
    f4: String?;
    f5: Bool;

    init() {
        self.f1 = InnerStruct{ a: 10, b: true };
        self.f2 = InnerStruct{ a: 20, b: null };
        self.f3 = 30;
        self.f4 = null;
        self.f5 = false;
    }
}