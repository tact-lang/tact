struct PackedSmall {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint8;
    d: Int as uint8;
}

contract TestContract {
    smalls: PackedSmall;

    init() {
        self.smalls = PackedSmall{ a:1, b:2, c:3, d:4 };
    }
}