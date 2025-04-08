struct InnerBoolOpt {
    a: Bool?;
    b: Bool?;
}

contract OptBoolNested {
    val: InnerBoolOpt;
    init() {
        self.val = InnerBoolOpt{ a:null, b:null };
    }
}