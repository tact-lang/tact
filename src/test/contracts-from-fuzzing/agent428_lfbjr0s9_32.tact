struct WithRemainder {
    prefix: Int as uint8;
    payload: Slice as remaining;
}

contract TestContract {
    opt: WithRemainder?;

    init() {
        self.opt = null;
    }
}