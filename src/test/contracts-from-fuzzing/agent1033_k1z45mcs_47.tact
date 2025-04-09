struct S {
    x: Int;
}
struct W {
    a: S;
    b: S;
    c: S;
}

contract ManyStructs {
    w: W;

    init() {
        self.w = W{
            a: S{ x:11 },
            b: S{ x:22 },
            c: S{ x:33 }
        };
    }
}