struct BoolWrap { flag: Bool; }

contract ManyBools {
    a: BoolWrap;
    b: BoolWrap;
    c: BoolWrap;
    d: BoolWrap;
    e: BoolWrap;
    f: BoolWrap;
    g: BoolWrap;
    h: BoolWrap;
    init() {
        self.a = BoolWrap{flag:true};
        self.b = BoolWrap{flag:false};
        self.c = BoolWrap{flag:true};
        self.d = BoolWrap{flag:false};
        self.e = BoolWrap{flag:true};
        self.f = BoolWrap{flag:false};
        self.g = BoolWrap{flag:true};
        self.h = BoolWrap{flag:false};
    }
}