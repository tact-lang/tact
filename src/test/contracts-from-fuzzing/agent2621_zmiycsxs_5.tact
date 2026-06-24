struct Deep {
    x: Int;
    y: Bool?
}

struct Mid {
    inner: Deep;
    s: String;
}

struct Outer {
    mid: Mid;
    s2: String?;
}

contract Test {
    outer: Outer;
    init() {
        self.outer = Outer{
            mid: Mid{
                inner: Deep{ x: 7, y: true },
                s: "hi"
            },
            s2: null
        };
    }
}