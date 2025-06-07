struct Wrapped {
    inner: Int;
}

contract OptionalTop {
    optStruct: Wrapped?;
    init() {
        self.optStruct = null;
    }
}