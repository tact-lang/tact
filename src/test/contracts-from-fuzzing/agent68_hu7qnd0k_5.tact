struct Narrow {
    a: Int as uint8;
    b: Int as uint16;
}

struct Wide {
    c: Int as uint128;
    d: Int;
}

struct Mixed {
    left: Narrow;
    right: Wide?;
}

contract SerWidths {
    s: Mixed;

    init() {
        self.s = Mixed{
            left: Narrow{
                a: 255,
                b: 65535
            },
            right: null
        };
    }
}
