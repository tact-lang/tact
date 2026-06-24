struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract LargeStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: "def",
            g: 2,
            h: true,
            i: "ghi",
            j: 3
        };
    }
}