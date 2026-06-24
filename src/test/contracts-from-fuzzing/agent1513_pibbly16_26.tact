struct S {
    a: Int;
    b: Bool;
}

contract FieldStruct {
    s: S;

    init() {
        self.s = S{a:1, b:true};
    }
}