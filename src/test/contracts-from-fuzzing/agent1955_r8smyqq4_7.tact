struct BigNested {
    part1: Int;
    part2: Int;
    part3: Int;
}

struct Layer2 {
    n1: BigNested;
    n2: BigNested;
    n3: BigNested;
}

contract Complex {
    store: Layer2;

    init() {
        self.store = Layer2{
            n1: BigNested{part1: 1, part2: 2, part3: 3},
            n2: BigNested{part1: 4, part2: 5, part3: 6},
            n3: BigNested{part1: 7, part2: 8, part3: 9},
        };
    }
}
