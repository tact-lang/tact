struct Inner {
    x: Int;
    y: String;
}

struct Middle {
    inner: Inner;
    tag: String;
}

struct Outer {
    middle: Middle;
    status: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{ x: 9, y: "nine" },
                tag: "mid"
            },
            status: true
        };
    }
}