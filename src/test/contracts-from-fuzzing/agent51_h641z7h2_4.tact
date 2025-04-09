struct Deep {
    d: Int = 1;
    e: String = "e";
    f: Bool = true;
}

struct Mid {
    g: Deep;
    h: Int = 2;
}

struct Top {
    i: Mid;
    j: Bool = false;
}

contract Test {
    data: Top;
    init() {
        self.data = Top{ i: Mid{ g: Deep{}, h: 2 }, j: false };
    }
}