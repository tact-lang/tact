struct Inner1 {
    value1: Int;
    flag1: Bool;
}

struct Inner2 {
    value2: Int;
    flag2: Bool;
}

struct TopNested {
    part1: Inner1;
    part2: Inner2;
}

contract DoubleNested {
    data: TopNested;
    init() {
        self.data = TopNested {
            part1: Inner1 { value1: 3, flag1: true },
            part2: Inner2 { value2: 5, flag2: false }
        };
    }
}
