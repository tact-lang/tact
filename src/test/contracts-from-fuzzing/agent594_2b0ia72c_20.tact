struct RemainingFrag {
    payload: Slice as remaining;
}

contract Test20 {
    rem: RemainingFrag;

    init() {
        self.rem = RemainingFrag{
            payload: emptyCell().asSlice(),
        };
    }

    receive() {}
}