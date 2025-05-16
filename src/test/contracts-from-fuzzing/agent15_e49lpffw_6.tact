struct Deeper {
    i: Int?;
    b: Bool?;
}

struct Mid {
    deeper: Deeper;
    flag: Bool;
}

struct Root {
    mid: Mid;
    num: Int;
}

contract DeepOptionChain {
    state: Root;

    init() {
        self.state = Root{
            mid: Mid{
                deeper: Deeper{ i: null, b: null },
                flag: true
            },
            num: 456
        };
    }
}