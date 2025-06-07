struct MultiLayer {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    flag: Bool;
    txt: String;
    maybe: Int?;
}

contract DoubleNestedStruct {
    field: MultiLayer;

    init() {
        self.field = MultiLayer{
            inner1: Inner{ flag:true, txt:"abc", maybe:null },
            inner2: Inner{ flag:false, txt:"xyz", maybe:123 }
        };
    }
}