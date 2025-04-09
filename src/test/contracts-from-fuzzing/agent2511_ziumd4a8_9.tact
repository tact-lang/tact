struct InnerStruct {
    p: Int;
    q: String;
}

contract ArrayishContract {
    s0: InnerStruct;
    s1: InnerStruct;
    s2: InnerStruct;

    init() {
        self.s0 = InnerStruct{p:0, q:"a"};
        self.s1 = InnerStruct{p:1, q:"b"};
        self.s2 = InnerStruct{p:2, q:"c"};
    }
}