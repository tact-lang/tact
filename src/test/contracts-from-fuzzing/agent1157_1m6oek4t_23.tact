struct WithRem {
    a: Int;
    tail: Slice as remaining;
}

contract RemainingPersistTest {
    val: WithRem;

    init() {
        self.val = WithRem{
            a: 77,
            tail: emptyCell().asSlice()
        };
    }

    receive() {
        let tmp = self.val;
    }
}