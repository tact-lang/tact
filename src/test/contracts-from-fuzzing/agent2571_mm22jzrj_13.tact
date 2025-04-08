struct Crazy {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: String?;
    f: Int?;
    g: Bool;
}

contract Mixed {
    val: Crazy;

    init() {
        self.val = Crazy{
            a: 9,
            b: null,
            c: "hello",
            d: true,
            e: null,
            f: 123,
            g: false,
        };
    }
}
