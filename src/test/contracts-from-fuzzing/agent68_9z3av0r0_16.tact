struct Mid {
    a: Bool;
    b: Int;
}

struct Top {
    m: Mid?;
    x: Int;
}

contract MixedOptionals {
    t: Top;

    init() {
        self.t = Top{
            m: null,
            x: 42
        };
    }
}