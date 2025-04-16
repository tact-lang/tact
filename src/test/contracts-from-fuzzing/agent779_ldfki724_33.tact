struct OptionInBetween {
    a: Int;
    b: Bool?;
    c: Int;
}

contract OptionalMiddle {
    s: OptionInBetween;

    init() {
        self.s = OptionInBetween{
            a: 55,
            b: null,
            c: 66
        };
    }
}