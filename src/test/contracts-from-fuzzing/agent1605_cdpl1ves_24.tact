struct InnerStruct {
    flag: Bool;
    data: Int;
}

contract StructArray {
    s1: InnerStruct;
    s2: InnerStruct;
    s3: InnerStruct;

    init() {
        self.s1 = InnerStruct{flag: true, data: 1};
        self.s2 = InnerStruct{flag: false, data: 2};
        self.s3 = InnerStruct{flag: false, data: 3};
    }
}