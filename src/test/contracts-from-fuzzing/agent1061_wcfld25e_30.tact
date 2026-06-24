// Struct with large number of nested optional fields + serialization attributes
struct Sx {
    a: Int as uint8;
    b: Bool?;
    c: Int? as uint16;
    d: String?;
    e: Address?;
    f: Bool?;
    g: Int? as uint4;
}

contract Test {
    s: Sx;

    init() {
        self.s = Sx{
            a: 1,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}