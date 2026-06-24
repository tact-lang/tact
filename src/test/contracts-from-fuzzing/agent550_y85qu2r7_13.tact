struct TailOpt {
    x: Int;
    y: Slice as remaining;
}

contract RemainingField {
    val: TailOpt;

    init() {
        self.val = TailOpt{
            x: 42,
            y: emptyCell().asSlice()
        };
    }
}