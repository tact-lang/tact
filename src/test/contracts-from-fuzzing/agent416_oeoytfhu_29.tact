struct Bottom {
    z: Int;
}
struct Mid {
    m: Bottom;
}
struct Top {
    t: Mid;
}

contract Test29 {
    data: Top;

    init() {
        self.data = Top{ t: Mid{ m: Bottom{ z: 50 } } };
    }
}
