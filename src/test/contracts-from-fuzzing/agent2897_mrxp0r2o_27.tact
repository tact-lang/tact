struct WithRemaining {
    data: Slice as remaining;
}

contract RemainingDataContract {
    blob: WithRemaining;
    init() {
        self.blob = WithRemaining{data: "a".asComment().asSlice()};
    }
}