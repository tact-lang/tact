struct AA {
    x: Int;
    y: Int;
}

struct BB {
    x: Int;
    y: Int;
}

contract TwoSimilarStructs {
    a: AA;
    b: BB;

    init() {
        self.a = AA{ x:1, y:2 };
        self.b = BB{ x:3, y:4 };
    }
}