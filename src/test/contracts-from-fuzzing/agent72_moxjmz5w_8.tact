struct Sub {
    v: Int;
}

struct Mid {
    sub: Sub;
}

struct Top {
    mid: Mid;
}

contract DeepNesting {
    data: Top;

    init() {
        self.data = Top{ mid: Mid{ sub: Sub{ v: 99 } } };
    }
}