struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract OptInContract {
    nested: NestedOpt?;

    init() {
        self.nested = NestedOpt{ a:null, b:true };
    }
}
