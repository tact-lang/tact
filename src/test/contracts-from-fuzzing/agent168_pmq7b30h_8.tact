struct Mid {
    i: Int;
    s: String;
}

contract DefaultValues {
    mid: Mid = Mid{
        i: 42,
        s: "init",
    };

    init() {
        self.mid = Mid{
            i: 100,
            s: "overwritten",
        };
    }
}
