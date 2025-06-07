struct Inner {
    x: Int;
    y: Int;
}

struct Mid {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Mid;
    text: String;
}

contract NestedLayers {
    st: Outer;

    init() {
        self.st = Outer{
            mid: Mid{
                inner: Inner{x: 1, y: 2},
                flag: false
            },
            text: "ok"
        };
    }
}
