struct RemainLast {
    a: Int;
    b: Slice as remaining;
}

contract RemStuff {
    val: RemainLast;

    init() {
        self.val = RemainLast{a:123, b:emptyCell().asSlice()};
    }
}