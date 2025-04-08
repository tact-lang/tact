struct S {
    a: Int;
    b: Bool;
}

contract OverwriteInInit {
    s: S = S{a:1,b:true};

    init() {
        self.s = S{a:5,b:false};
    }
}