struct PrimWrap {
    n: Int;
    s: String;
    b: Bool;
}

contract MultipleWraps {
    w1: PrimWrap;
    w2: PrimWrap;
    w3: PrimWrap;
    w4: PrimWrap;

    init() {
        self.w1 = PrimWrap{n:1,s:"a",b:true};
        self.w2 = PrimWrap{n:2,s:"b",b:false};
        self.w3 = PrimWrap{n:3,s:"c",b:true};
        self.w4 = PrimWrap{n:4,s:"d",b:false};
    }
}
