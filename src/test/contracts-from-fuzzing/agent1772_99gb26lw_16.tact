struct Mid {
    m1: Int;
    m2: Bool;
}

struct Top {
    t1: Int;
    t2: Mid;
    t3: String;
    t4: Bool?;
}

contract Test16 {
    top: Top;

    init() {
        self.top = Top{
            t1: 11,
            t2: Mid{ m1: 22, m2: true },
            t3: "hello",
            t4: null
        };
    }
}