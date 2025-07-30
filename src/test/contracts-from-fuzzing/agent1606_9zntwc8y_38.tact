struct WithRemaining {
    num: Int;
    data: Slice as remaining;
}

contract RemainingCheck {
    val: WithRemaining;

    init() {
        self.val = WithRemaining{
            num:42,
            data: emptyCell().asSlice()
        };
    }

    receive() {
        let v = self.val;
    }
}