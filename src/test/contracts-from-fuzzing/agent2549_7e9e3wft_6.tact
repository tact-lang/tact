struct Mid {
    x: Int;
    y: Bool;
}

struct Outer {
    p: Mid;
    q: Bool;
    r: String;
}

contract Storage {
    state: Outer;

    init() {
        self.state = Outer{
            p: Mid{
                x: 123,
                y: true,
            },
            q: false,
            r: "abc",
        };
    }
}