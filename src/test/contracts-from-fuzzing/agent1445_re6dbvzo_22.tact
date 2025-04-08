struct LotsofPrimitives {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
}

contract OnlyPrimitives {
    data: LotsofPrimitives;

    init() {
        self.data = LotsofPrimitives{
            a: 1, b: false, c: 3, d: true,
            e: 5, f: false, g: 7, h: true,
        };
    }
}