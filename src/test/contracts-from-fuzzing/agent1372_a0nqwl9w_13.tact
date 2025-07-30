struct OneLevel {
    a: Int; b: Bool; c: String;
}

struct TwoLevel {
    inner: OneLevel;
    d: String;
}

struct ThreeLevel {
    mid: TwoLevel;
    e: Int;
}

contract Test {
    data: ThreeLevel;

    init() {
        self.data = ThreeLevel{
            mid: TwoLevel{
                inner: OneLevel{
                    a: 5,
                    b: true,
                    c: "hi",
                },
                d: "yep",
            },
            e: 42,
        };
    }
}