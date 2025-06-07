struct InnerMost {
    s: String;
}
struct Mid {
    a: InnerMost;
    b: InnerMost;
}
struct Outer {
    pair: Mid;
}
contract MultipleStringNest {
    data: Outer;
    init() {
        self.data = Outer{
            pair: Mid{
                a: InnerMost{ s: "hello" },
                b: InnerMost{ s: "world" }
            }
        };
    }
}
