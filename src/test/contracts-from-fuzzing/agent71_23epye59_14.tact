struct InnerStruct {
    x: Int;
    y: String;
    z: String?;
}

contract StructArrayEmu {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;

    init() {
        self.s1 = InnerStruct{ x: 1, y: "a", z: null };
        self.s2 = InnerStruct{ x: 2, y: "b", z: null };
        self.s3 = InnerStruct{ x: 3, y: "c", z: null };
    }
}