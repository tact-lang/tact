struct Bottom {
    flag1: Bool?;
    flag2: Bool?;
}

struct Mid {
    bottom: Bottom;
}

struct Top {
    mid: Mid;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{ mid: Mid{ bottom: Bottom{ flag1: null, flag2: true } } };
    }
}
