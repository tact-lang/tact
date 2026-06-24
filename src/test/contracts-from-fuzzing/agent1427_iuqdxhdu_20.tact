contract RemainingAtEndOk {
    someNumber: Int;
    body: Slice as remaining;
    init() {
        self.someNumber = 42;
        self.body = emptyCell().asSlice();
    }
}