struct RepeatedStruct {
    a: Int;
    b: Bool;
}

contract MultipleSameStructFields {
    s1: RepeatedStruct;
    s2: RepeatedStruct;
    s3: RepeatedStruct;

    init() {
        self.s1 = RepeatedStruct{a:1, b:true};
        self.s2 = RepeatedStruct{a:2, b:false};
        self.s3 = RepeatedStruct{a:3, b:true};
    }
}