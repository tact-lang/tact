struct Wrapper {
    v: Int;
}

contract OptionalStruct {
    inner: Wrapper?;

    init() {
        self.inner = Wrapper{v:5};
    }
}