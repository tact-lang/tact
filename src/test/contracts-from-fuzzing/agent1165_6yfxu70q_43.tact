struct DefaultsInMiddle {
    a: Int;
    b: Bool = false;
    c: Int;
}

contract MiddleDefaults {
    x: DefaultsInMiddle;

    init() {
        self.x = DefaultsInMiddle{ a: 1, c: 2 };
    }
}
