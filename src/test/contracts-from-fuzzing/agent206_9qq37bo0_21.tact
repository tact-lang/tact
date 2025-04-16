struct Inner {
    num: Int?;
    flag: Bool?;
}

contract OptionalStructLayer {
    optStruct: Inner?;

    init() {
        self.optStruct = null;
    }
}
