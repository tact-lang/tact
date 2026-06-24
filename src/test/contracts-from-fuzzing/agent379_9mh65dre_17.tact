struct Part {
    a: Int as uint2;
    flag: Bool?;
}

struct Whole {
    part1: Part?;
    part2: Part?;
    id: Int as uint8;
}

contract NestedCompactParam(
    state: Whole,
) {}
