// Struct with many bools, checking bit-packing
struct Bools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
}

contract PackedBools {
    flags: Bools;
    init() {
        self.flags = Bools{
            b1: false,
            b2: true,
            b3: false,
            b4: true,
            b5: false,
            b6: true,
            b7: false,
            b8: true
        };
    }
    receive() {
        if (self.flags.b1) {
            self.flags.b2 = false;
        }
    }
}