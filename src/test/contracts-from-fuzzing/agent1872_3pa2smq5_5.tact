struct OptionalInner {
    a: Int;
    b: String;
}

contract OptStruct {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}