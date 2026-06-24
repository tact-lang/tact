struct Innards {
    optNum: Int?;
    optStr: String?;
}

struct OuterBoss {
    part1: Innards?;
    part2: Innards?;
}

contract OptionBoss {
    core: OuterBoss?;
}