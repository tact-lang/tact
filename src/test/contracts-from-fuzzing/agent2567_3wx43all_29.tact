struct RestTail {
    x: Int;
    tail: Slice as remaining;
}

contract RestTailStructStorage {
    s: RestTail;
    init() {
        self.s = RestTail{
            x:42,
            tail: emptyCell().asSlice()
        };
    }
}