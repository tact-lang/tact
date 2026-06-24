struct Bottom {
    foo: String? = null;
    bar: Int? = 10;
}
struct Middle {
    sub1: Bottom?;
    sub2: Bottom = Bottom{};
}

contract OptionalMatrix {
    a: Int?;
    b: Bool? = true;
    c: String?;
    d: Bottom?;
    e: Middle;

    init() {
        self.a = null;
        self.c = "X";
        self.d = Bottom{ foo: "bar", bar: null };
        self.e = Middle{ sub1: null, sub2: Bottom{ foo: null, bar: 0 } };
    }
}