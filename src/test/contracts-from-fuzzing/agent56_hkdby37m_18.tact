struct NestedBoolOpt {
    a: Bool;
    b: Bool?;
    c: Bool?;
}

contract BoolOptionals {
    bo: NestedBoolOpt;

    init() {
        self.bo = NestedBoolOpt{ a:true, b:null, c:true };
    }
}