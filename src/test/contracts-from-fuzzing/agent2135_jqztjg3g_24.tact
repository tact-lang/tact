struct NestedOpt {
    inn: Int?;
}

contract OptionalsMix {
    a: Int?;
    b: NestedOpt?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = NestedOpt{inn:null};
        self.c = true;
    }
}