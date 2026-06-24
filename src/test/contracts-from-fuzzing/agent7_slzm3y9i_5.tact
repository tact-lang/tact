contract TestAssignmentCorrect {
    x: Int = 5;

    receive() {
        self.x += 10;
        dump(self.x);
    }
}
