struct MultiLevel {
    s: String;
    n: Int;
}

struct WithMultiLevel {
    i: Int;
    lvl: MultiLevel;
    b: Bool;
}

contract MiddleNesting {
    data: WithMultiLevel;

    init() {
        self.data = WithMultiLevel{
            i: 3,
            lvl: MultiLevel{
                s: "ok",
                n: 7,
            },
            b: true,
        };
    }
}