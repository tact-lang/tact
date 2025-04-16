struct W {
    a: Int;
    b: Bool;
}

struct X {
    w: W;
}

struct Y {
    x: X;
}

struct Z {
    y: Y;
}

contract DeepFourStructs {
    z: Z;

    init() {
        self.z = Z{ y: Y{ x: X{ w: W{ a:1, b:false } } } };
    }
}