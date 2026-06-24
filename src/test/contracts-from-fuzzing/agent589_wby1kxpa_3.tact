struct Deep {
    x: Int;
    y: Bool?;
}

struct Middle {
    d: Deep;
    s: String;
}

contract Test {
    param: Middle;

    init() {
        self.param = Middle{
            d: Deep{
                x: 7,
                y: true,
            },
            s: "hello",
        };
    }
}