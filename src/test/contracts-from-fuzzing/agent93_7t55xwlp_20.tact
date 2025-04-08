struct RecA {
    x: Int;
    y: Int;
}

struct RecB {
    left: RecA;
    right: Int?;
}

contract RecContract {
    rec: RecB = RecB{ left: RecA{ x: 3, y: 4 }, right: null };
}