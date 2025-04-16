struct Leaf1 { val1: Int; val2: Bool; }
struct Leaf2 { val3: Int?; }
struct Mid {
    leafOne: Leaf1;
    leafTwo: Leaf2;
}

struct Top {
    mid: Mid;
    optFlag: Bool?;
}

contract MultiLayer {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                leafOne: Leaf1{ val1: 5, val2: false },
                leafTwo: Leaf2{ val3: null }
            },
            optFlag: true
        };
    }
}