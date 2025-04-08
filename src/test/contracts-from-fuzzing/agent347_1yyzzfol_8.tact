struct Inner1 {
    x: Int;
    y: Bool?;
}

struct Inner2 {
    msg: String = "ok";
    num: Int?;
}

struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Inner1;
    g: Inner2;
    h: Int?;
    i: Bool;
    j: String;
}

contract BigStorage {
    data: Big;

    init() {
        self.data = Big{
            a: 1,
            b: true,
            c: "hello",
            d: 5,
            e: null,
            f: Inner1{ x: 7, y: false },
            g: Inner2{ msg: "hi", num: null },
            h: 9,
            i: false,
            j: "bye"
        };
    }
}