struct S {
    a: Int;
    b: Bool?;
}

contract OptionalBoolStruct {
    s: S;

    init() {
        self.s = S{a:42,b:null};
    }
}
