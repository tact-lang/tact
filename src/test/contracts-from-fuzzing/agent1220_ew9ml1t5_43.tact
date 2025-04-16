struct S {
    a: Int;
    b: Bool;
}

contract StructPersistent {
    s: S;

    init() {
        self.s = S{a:5,b:true};
    }
}