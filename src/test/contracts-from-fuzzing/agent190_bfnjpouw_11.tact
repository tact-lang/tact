struct Small {
    x: Int;
}

struct Mid {
    part1: Small;
    part2: Small;
    flag: Bool?;
}

struct Outer {
    i: Int;
    m1: Mid;
    m2: Mid;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            i: 7,
            m1: Mid{ part1: Small{ x: 1 }, part2: Small{ x: 2 }, flag: null },
            m2: Mid{ part1: Small{ x: 3 }, part2: Small{ x: 4 }, flag: true },
        };
    }
}