// Large struct, very wide with diverse optional/default fields
struct Wide {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int = 7;
    h: String = "foo";
}

contract StorageTest {
    w: Wide;

    init() {
        self.w = Wide{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null,
            g: 42,
            h: "bar"
        };
    }
}