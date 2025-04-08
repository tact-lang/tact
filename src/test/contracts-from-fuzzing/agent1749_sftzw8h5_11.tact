struct SubStruct {
    flag: Bool;
    label: String;
}

contract ArrayOfStructs {
    s1: SubStruct;
    s2: SubStruct;
    s3: SubStruct;

    init() {
        self.s1 = SubStruct{ flag: true, label: "one" };
        self.s2 = SubStruct{ flag: false, label: "two" };
        self.s3 = SubStruct{ flag: true, label: "three" };
    }
}