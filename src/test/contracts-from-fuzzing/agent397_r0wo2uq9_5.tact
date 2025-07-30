struct Packed {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
}

contract ManyBools {
    data: Packed;

    init() {
        self.data = Packed{
            b1: false, b2: false, b3: false, b4: false, b5: false,
            b6: false, b7: false, b8: false, b9: false, b10: false
        };
    }
}