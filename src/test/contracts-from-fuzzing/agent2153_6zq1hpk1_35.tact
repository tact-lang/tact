struct InnerLayer {
    flag: Bool;
    maybeVal: Int?;
}

contract OptStruct {
    payload: InnerLayer?;

    init() {
        self.payload = null;
    }
}
