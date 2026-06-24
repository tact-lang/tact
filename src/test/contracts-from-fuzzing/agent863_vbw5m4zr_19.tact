struct OptWrap {
    inner: Int?;
}

contract NullCtor {
    v: OptWrap;

    init() {
        self.v = OptWrap{ inner: null };
    }
}