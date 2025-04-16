struct OptBetween {
    a: Int;
    b: Int?;
    c: Int;
}

contract OptMiddle {
    st: OptBetween;
    init() {
        self.st = OptBetween{
            a: 1,
            b: null,
            c: 3
        };
    }
}
