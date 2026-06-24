struct WithSlice {
    data: Slice;
    info: String;
}

contract SliceStore {
    stored: WithSlice;

    init() {
        self.stored = WithSlice{
            data: emptyCell().asSlice(),
            info: "slice"
        };
    }
}
