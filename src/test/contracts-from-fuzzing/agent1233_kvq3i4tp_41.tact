struct S {
    a: Int;
    b: Bool;
}

contract NestedDefaults {
    s: S;

    init() {
        self.s = S{a:0,b:false};
    }
}