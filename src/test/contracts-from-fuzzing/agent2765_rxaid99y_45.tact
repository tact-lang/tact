struct OptionalStringInner {
    s: String?;
}

contract OptionalStringStruct {
    v: OptionalStringInner;
    init() {
        self.v = OptionalStringInner{s:null};
        self.v = OptionalStringInner{s:"x"};
    }
}