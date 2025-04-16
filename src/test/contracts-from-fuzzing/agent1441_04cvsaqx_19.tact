struct A {
    x: Int;
    y: Bool;
}

struct B {
    z: String;
    inner: A;
}

contract BigMix {
    a: A;
    b: B;
    flag: Bool;
    opt: String?;

    init() {
        self.a = A{ x:5, y:false };
        self.b = B{ z:"hi", inner:A{ x:7, y:true } };
        self.flag = true;
        self.opt = null;
    }
}