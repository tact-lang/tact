struct Chain {
    a: Bool;
    b: Nested;
}

struct Nested {
    x: Int;
    y: Bool;
    s: String;
}

contract ChainContract {
    ch: Chain;

    init() {
        self.ch = Chain{
            a: false,
            b: Nested{x: 123, y: true, s: "hi"}
        };
    }
}
