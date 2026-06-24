struct X {
    x1: Int?;
    x2: Bool?;
    x3: String?;
}

struct Y {
    y1: X?;
    y2: Bool;
}

contract OptStructs {
    y: Y?;

    init() {
        self.y = Y{
            y1: null,
            y2: true
        };
    }
}