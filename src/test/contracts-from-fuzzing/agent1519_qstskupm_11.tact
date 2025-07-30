struct Variants {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int64;
    d: Int as uint32;
    e: Int as coins;
}

contract DifferentIntWidths {
    v: Variants = Variants{
        a:1, b:-2, c:3, d:4, e:5
    };

    init() {
        self.v = Variants{a:10, b:-20, c:30, d:40, e:50};
    }
}