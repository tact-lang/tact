struct Simple {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: String;
    f: String?;
}

contract Variety {
    s: Simple;

    init() {
        self.s = Simple{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "hello",
            f: null
        };
    }
}