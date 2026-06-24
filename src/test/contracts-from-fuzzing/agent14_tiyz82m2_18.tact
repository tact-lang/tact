struct DeeplyNested {
    l1: Bool;
    l2: String;
    l3: Int;
}

contract LotsOfStructs {
    s1: DeeplyNested;
    s2: DeeplyNested;
    s3: DeeplyNested;
    s4: DeeplyNested;

    init() {
        self.s1 = DeeplyNested{ l1:true, l2:"a", l3:1 };
        self.s2 = DeeplyNested{ l1:false, l2:"b", l3:2 };
        self.s3 = DeeplyNested{ l1:true, l2:"c", l3:3 };
        self.s4 = DeeplyNested{ l1:false, l2:"d", l3:4 };
    }
}