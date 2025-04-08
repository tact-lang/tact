struct TrailingRest {
    a: Int;
    b: String;
    rem: Slice as remaining;
}

contract RestAtEnd {
    val: TrailingRest;

    init() {
        self.val = TrailingRest{a:88,b:"xyz",rem:emptyCell().asSlice()};
    }
}