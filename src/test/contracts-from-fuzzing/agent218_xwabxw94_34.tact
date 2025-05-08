struct Bottom {
    v: Int;
}

struct Middle {
    b: Bottom;
}

struct Top {
    m: Middle;
}

contract DeepSimple {
    field: Top;

    init() {
        self.field = Top{ m: Middle{ b: Bottom{ v: 55 } } };
    }
}