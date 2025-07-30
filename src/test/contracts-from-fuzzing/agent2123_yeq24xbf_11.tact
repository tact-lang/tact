contract NestedOptionalsInStructs {
    s: S?;

    init() {
        self.s = S{
            n: N{
                value: 42,
                flag: true
            },
            o: "hello"
        };
    }
}

struct N {
    value: Int;
    flag: Bool;
}

struct S {
    n: N;
    o: String?;
}