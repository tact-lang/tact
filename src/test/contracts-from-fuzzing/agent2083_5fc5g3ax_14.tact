struct Wrapper {
    inner: Int?;
    txt: String;
}

contract OptionalWrapper {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: null,
            txt: "wrapped",
        };
    }
}
