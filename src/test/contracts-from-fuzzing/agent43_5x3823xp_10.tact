struct IdStruct {
    id: Int;
}

contract ListStruct {
    s1: IdStruct;
    s2: IdStruct;
    s3: IdStruct;

    init() {
        self.s1 = IdStruct{id:1};
        self.s2 = IdStruct{id:2};
        self.s3 = IdStruct{id:3};
    }
}
