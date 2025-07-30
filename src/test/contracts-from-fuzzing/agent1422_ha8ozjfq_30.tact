struct S {
    a: Int;
    b: String?;
    c: Bool;
}

contract InitMix {
    r: S;

    init() {
        self.r = S{
            a: 3,
            b: null,
            c: true,
        };
    }
}