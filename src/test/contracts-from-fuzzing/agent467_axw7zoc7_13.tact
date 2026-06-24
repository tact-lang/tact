struct Wide {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    x11: Bool;
    x12: Bool;
    x13: Bool;
    x14: Bool;
    x15: Bool;
    x16: Bool;
    x17: Bool;
    x18: Bool;
    x19: Bool;
    x20: Bool;
}

contract TestContract {
    data: Wide;

    init() {
        self.data = Wide{
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: 6,
            x7: 7,
            x8: 8,
            x9: 9,
            x10: 10,
            x11: true,
            x12: false,
            x13: true,
            x14: false,
            x15: true,
            x16: false,
            x17: true,
            x18: false,
            x19: true,
            x20: false,
        };
    }
}