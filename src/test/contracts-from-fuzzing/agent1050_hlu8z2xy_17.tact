struct IntAndOpt {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
}

contract ShuffleOpt {
    val: IntAndOpt;

    init() {
        self.val = IntAndOpt{
            a:1,b:null,c:3,d:4,e:5,f:null
        };
    }
}
