struct InnerDeep {
    leaf1: Int;
    leaf2: Bool;
    leaf3: String;
}

struct MiddleDeep {
    part1: InnerDeep?;
    part2: String;
}

contract Combo {
    data: MiddleDeep;

    init() {
        self.data = MiddleDeep{part1: null, part2: "hello"};
    }
}
