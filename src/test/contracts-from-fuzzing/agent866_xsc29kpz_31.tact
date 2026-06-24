struct Sub1 {
    x: Int;
}

struct Sub2 {
    y: Int;
}

struct Sub3 {
    z: Int;
}

contract Combined {
    p: Sub1;
    q: Sub2;
    r: Sub3;
    init() {
        self.p=Sub1{x:1};
        self.q=Sub2{y:2};
        self.r=Sub3{z:3};
    }
}