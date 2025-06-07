struct Tail {
    s: Slice as remaining;
}

contract RemainingField {
    tail: Tail;

    init() {
        self.tail = Tail{s: beginCell().endCell().asSlice()};
    }
}