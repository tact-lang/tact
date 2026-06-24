message(42) OptMsg { x: Int; }

contract OptMsgStore {
    m: OptMsg?;

    init() {
        self.m = null;
    }
}