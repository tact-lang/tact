struct WithRemaining {
    num: Int;
    rest: Slice as remaining;
}

contract RemainingInsideStruct {
    val: WithRemaining;

    init() {
        self.val = WithRemaining{ num: 100, rest: emptyCell().asSlice() };
    }
}