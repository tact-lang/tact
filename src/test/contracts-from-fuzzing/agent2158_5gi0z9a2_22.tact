struct WithRemaining {
    x: Int;
    rest: Slice as remaining;
}

contract RemainingFieldTest {
    data: WithRemaining;
    
    init() {
        self.data = WithRemaining{
            x: 1,
            rest: emptyCell().asSlice()
        };
    }
}