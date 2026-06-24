struct SN {
    id: Int;
    info: String;
    optVal: Int?;
}

contract TestContract {
    s1: SN;
    s2: SN;
    
    init() {
        self.s1 = SN{id:1, info:"aaa", optVal:null};
        self.s2 = SN{id:2, info:"bbb", optVal:42};
    }
    
    receive() {}
}