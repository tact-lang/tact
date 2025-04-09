struct S {
    a: Int;
    b: String;
}

contract Defaults {
    s1: S = S{ a:1, b:"x" };
    opt: S? = null;

    init() {
        self.s1 = S{ a:2, b:"y" };
        self.opt = S{ a:3, b:"z" };
    }
}