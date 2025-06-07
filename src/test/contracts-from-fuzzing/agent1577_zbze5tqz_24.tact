struct RemainingSlice {
    label: String;
    data: Slice as remaining;
}

contract TestContract {
    chunk: RemainingSlice;
    init() {
        self.chunk = RemainingSlice{
            label: "remains",
            data: emptyCell().asSlice()
        };
    }
}