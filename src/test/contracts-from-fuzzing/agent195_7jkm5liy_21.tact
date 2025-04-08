struct A {
    x: Int;
    y: String?;
}

struct B {
    z: Bool;
    w: Int?;
    sub: A;
}

contract Compose {
    f: A;
    g: B;

    init() {
        self.f = A{ x: 10, y: null };
        self.g = B{ z:true, w:null, sub:A{ x:-5, y:"hello" } };
    }
}
