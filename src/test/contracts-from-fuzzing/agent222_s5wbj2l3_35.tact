struct TestPoints {
    x: Int;
    y: Int;
}

contract ListOfStructs {
    p1: TestPoints;
    p2: TestPoints;
    p3: TestPoints;

    init() {
        self.p1 = TestPoints{ x:1, y:2 };
        self.p2 = TestPoints{ x:3, y:4 };
        self.p3 = TestPoints{ x:5, y:6 };
    }
}