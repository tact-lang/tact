struct SubStruct {
    val1: Int;
    val2: Int;
}

contract ArrayOfStructs {
    s1: SubStruct;
    s2: SubStruct;
    s3: SubStruct;

    init() {
        self.s1 = SubStruct{ val1:1, val2:2 };
        self.s2 = SubStruct{ val1:3, val2:4 };
        self.s3 = SubStruct{ val1:5, val2:6 };
    }
}