// Large struct with mixed optionality, serialization, defaults
struct Crazy {
    a: Int as int8 = 1;
    b: Bool = false;
    c: String? = null;
    d: Int?;
    e: Int as uint16;
    f: Bool?;
    g: String;
    h: Int?=null;
}

contract CrazyTest {
    c: Crazy;

    init() {
        self.c = Crazy{
            d: null,
            f: null,
            e: 5,
            g: "g",
        };
    }
}