struct Sub {
    flag: Bool = false;
}

struct Mid {
    sub: Sub;
}

struct Container {
    mid: Mid?;
}

contract OptionalMidStruct {
    data: Container = Container{ mid: null };
}