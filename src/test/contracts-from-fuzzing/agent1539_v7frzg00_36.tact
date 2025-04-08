struct ManyWrap {
    s: Wrap;
    t: Wrap;
}

struct Wrap {
    a: Int;
    b: Bool;
    c: String;
}

contract WrapTest {
    mw: ManyWrap;
    init() {
        self.mw = ManyWrap{
            s: Wrap{a:1,b:true,c:"x"},
            t: Wrap{a:2,b:false,c:"y"}
        };
    }
}