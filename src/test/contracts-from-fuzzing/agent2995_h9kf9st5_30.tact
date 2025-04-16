contract FinalAssignment {
    x: Int as uint4;

    init() {
        self.x = 3;
        self.x = 25; // over uint4 max 15
        self.x = 10; // final ok
    }
}