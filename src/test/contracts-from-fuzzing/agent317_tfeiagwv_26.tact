struct S {
    x: Int;
    y: Bool;
}

contract MultiStructFields {
    a: S;
    b: S;
    c: S;
    d: S;

    init() {
        self.a = S{x:1, y:true};
        self.b = S{x:2, y:false};
        self.c = S{x:3, y:true};
        self.d = S{x:4, y:false};
    }
}