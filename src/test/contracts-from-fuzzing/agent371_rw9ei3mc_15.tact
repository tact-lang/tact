struct OptionalStruct {
    f: Int?;
}

contract OptStructArray {
    s1: OptionalStruct;
    s2: OptionalStruct;
    s3: OptionalStruct;

    init() {
        self.s1 = OptionalStruct{f:null};
        self.s2 = OptionalStruct{f:null};
        self.s3 = OptionalStruct{f:null};
    }
}