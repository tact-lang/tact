struct NestedStruct {
    a: Int;
    b: String;
}

contract ArrayOfFields {
    s1: NestedStruct;
    s2: NestedStruct;
    s3: NestedStruct;

    init() {
        self.s1 = NestedStruct{ a:1, b:"x" };
        self.s2 = NestedStruct{ a:2, b:"y" };
        self.s3 = NestedStruct{ a:3, b:"z" };
    }
}