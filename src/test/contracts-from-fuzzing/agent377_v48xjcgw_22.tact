struct S {
    x: Int as uint8;
    y: Int as int4;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            x: 255,
            y: -8
        };
    }
}