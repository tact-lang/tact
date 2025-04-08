struct SubStruct {
    p: Int;
}

contract MultiCompose {
    s1: SubStruct;
    s2: SubStruct;
    s3: SubStruct;
    
    init() {
        self.s1=SubStruct{p:1};
        self.s2=SubStruct{p:2};
        self.s3=SubStruct{p:3};
    }
}