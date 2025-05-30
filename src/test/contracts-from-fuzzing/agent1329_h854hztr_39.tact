struct Chain {
    n: Int;
}

struct Chain2 {
    v: Chain;
}

struct Chain3 {
    v: Chain2;
}

struct Chain4 {
    v: Chain3;
}

struct Chain5 {
    v: Chain4;
}

struct Chain6 {
    v: Chain5;
}

contract Lvl6 {
    data: Chain6;

    init() {
        self.data = Chain6{ v: Chain5{ v: Chain4{ v: Chain3{ v: Chain2{ v: Chain{ n: 0 } } } } } };
    }
}
