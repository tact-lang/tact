struct InnerS {
    a: Int;
}

contract OptStruct {
    s: InnerS?;
    
    init() {
        self.s = null;
    }
}