struct Tiny {
    a: Int;
}

struct Medium {
    t: Tiny;
    s: String;
}

contract NestedOptionalsTest {
    m: Medium?;

    init() {
        self.m = Medium{
            t: Tiny{ a: 7 },
            s: "opt",
        };
    }
}
