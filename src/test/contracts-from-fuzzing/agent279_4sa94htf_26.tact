struct X {
    a: Int;
    b: Bool;
}

contract OptStructCross {
    x1: X?;
    optInt: Int?;
    x2: X?;

    init() {
        self.x1 = null;
        self.optInt = null;
        self.x2 = null;
    }
}