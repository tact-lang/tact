struct HasOptionalSlice {
    payload: Slice?;
    comment: String;
}

contract TestContract {
    s: HasOptionalSlice;

    init() {
        self.s = HasOptionalSlice{
            payload: null,
            comment: "hi"
        };
    }
}