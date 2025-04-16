struct StructWithManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: String?;
    i: String?;
    j: String?;
}

contract Test {
    s: StructWithManyOptionals;

    init() {
        self.s = StructWithManyOptionals{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null,
        };
    }
}