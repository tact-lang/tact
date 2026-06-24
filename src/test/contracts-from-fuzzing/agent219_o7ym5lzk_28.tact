struct Points {
    x: Int;
    y: Int;
    label: String?;
}

contract ArrayStyleHold {
    p1: Points;
    p2: Points;
    p3: Points;

    init() {
        self.p1 = Points{ x: 1, y: 2, label: null };
        self.p2 = Points{ x: 3, y: 4, label: "Middle" };
        self.p3 = Points{ x: 5, y: 6, label: null };
    }
}