struct OptionalInner {
    v: Int? as uint64;
}

contract OptionalInnerStructTest {
    optInner: OptionalInner;

    init() {
        self.optInner = OptionalInner{ v: null };
    }

    receive(){}
}