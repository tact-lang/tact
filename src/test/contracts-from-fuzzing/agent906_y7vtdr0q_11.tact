struct SSub {
    s: String;
}

struct SMain {
    a: Int;
    sub1: SSub;
    sub2: SSub;
}

contract RepNested {
    data: SMain;

    init() {
        self.data = SMain{
            a: 42,
            sub1: SSub{ s: "one" },
            sub2: SSub{ s: "two" },
        };
    }
}