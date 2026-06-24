struct S {
    a:Int; b:Int; c:Int;
}

contract DefaultNested {
    field: S = S{a:1,b:2,c:3};

    init() {
        self.field = S{a:4,b:5,c:6};
    }
}
