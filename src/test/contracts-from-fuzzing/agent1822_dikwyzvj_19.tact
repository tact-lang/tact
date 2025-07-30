struct Base {
    x: Int;
}

struct Mid {
    b: Base;
}

struct Top {
    m: Mid;
}

contract Compose {
    top: Top;

    init() {
        self.top = Top{ m: Mid{ b: Base{ x:42 } } };
    }
}