struct Packed {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    number: Int;
}

contract ManyBools {
    s: Packed;

    init() {
        self.s = Packed{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: false,
            number: 123,
        };
    }
}