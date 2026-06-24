struct Mid {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    x: Mid;
    y: Mid?;
}

contract Test {
    s: Outer;
    init() {
        self.s = Outer{
            x: Mid{foo: 7, bar: null},
            y: null
        };
    }
}