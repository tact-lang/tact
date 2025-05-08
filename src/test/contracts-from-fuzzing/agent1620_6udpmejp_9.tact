struct Mid {
    a: Int;
    b: Bool?;
}

struct Wrap {
    x: String;
    i: Mid;
    y: String;
}

contract Wrapper {
    nested: Wrap;

    init() {
        self.nested = Wrap{
            x: "xx",
            i: Mid{ a: 3, b: null },
            y: "yy",
        };
    }
}