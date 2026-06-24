struct BoolWrap { b: Bool; }
contract DeepBool {
    a: BoolWrap;
    b: BoolWrap;
    c: BoolWrap;
    init() {
        self.a=BoolWrap{b:true};
        self.b=BoolWrap{b:false};
        self.c=BoolWrap{b:true};
    }
}