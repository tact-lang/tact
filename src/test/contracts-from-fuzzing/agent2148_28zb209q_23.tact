struct Bottom {
    x: Int;
}

struct Middle {
    bottom: Bottom;
}

struct Top {
    middle: Middle;
}

contract Nest3 {
    data: Top;

    init() {
        self.data = Top{ middle: Middle{ bottom: Bottom{ x: 17 } } };
    }
}