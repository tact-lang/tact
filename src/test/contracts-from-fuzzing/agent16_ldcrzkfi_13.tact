struct InnerStruct {
    f1: Int;
    f2: Bool;
}

contract ArrayOfStructs {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;

    init() {
        self.s1 = InnerStruct{ f1: 1, f2: true };
        self.s2 = InnerStruct{ f1: 2, f2: false };
        self.s3 = InnerStruct{ f1: 3, f2: true };
    }
}