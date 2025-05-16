struct S {
    a: Int;
    b: Bool;
}

contract WithInit {
    s: S;

    init() {
        self.s = S{a:1,b:true};
    }
}