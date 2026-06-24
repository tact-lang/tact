struct Varied {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Bool;
    e: Bool?;
    f: String;
}

contract TestContract {
    data: Varied;

    init() {
        self.data = Varied{
            a: 255,
            b: -123456,
            c: 9999,
            d: false,
            e: true,
            f: "hello"
        };
    }
}
