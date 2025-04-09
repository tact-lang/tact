struct OptionalInner {
    foo: Int?;
    bar: Bool?;
    str: String?;
}

contract Test8 {
    optStruct: OptionalInner?;

    init() {
        self.optStruct = OptionalInner{foo: null, bar: null, str: null};
    }
}