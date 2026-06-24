struct InnerMost {
    x: Int = 42;
    flag: Bool?;
}

struct Nested {
    m: String = "m";
    optInner: InnerMost?;
    y: Int = 24;
}

struct Big {
    a: Int = 1;
    b: Bool = false;
    c: String = "c";
    d: Nested = Nested{};
    e: Int?;
    f: Bool?;
    g: String?;
    h: Int = 8;
    i: Bool = true;
    j: String = "j";
    k: Nested = Nested{};
    l: Int?;
    m: Bool = false;
    n: String?;
    o: Int = 15;
    p: Bool = true;
}

contract TestContract {
    data: Big = Big{};

    init() {
        self.data = Big{
            a: 2,
            b: true,
            c: "C",
            d: Nested{m: "nested", optInner: InnerMost{x: 100, flag: true}, y: 200},
            e: 3,
            f: true,
            g: "hello",
            h: 4,
            i: false,
            j: "J",
            k: Nested{m: "nested2", optInner: null, y: 201},
            l: 5,
            m: true,
            n: "world",
            o: 6,
            p: false
        };
    }
}