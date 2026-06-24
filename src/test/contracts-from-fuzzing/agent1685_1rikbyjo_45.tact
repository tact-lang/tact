struct IntPlusOpt {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract Interleaved {
    s: IntPlusOpt;

    init() {
        self.s = IntPlusOpt{
            a:1,b:null,c:2,d:null
        };
    }
}
