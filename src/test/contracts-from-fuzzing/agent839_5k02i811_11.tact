struct Sub1 {
    x: Int;
}

struct Sub2 {
    y: Int;
}

contract MultiStructs {
    a: Sub1;
    b: Sub2;
    c: Sub1?;
    d: Sub2?;
    init() {
        self.a = Sub1{x:1};
        self.b = Sub2{y:2};
        self.c = null;
        self.d = null;
    }
}