struct OptionalInner {
    innerVal: Int?;
    flag: Bool?;
}

contract OptTest {
    optField: OptionalInner;

    init() {
        self.optField = OptionalInner{
            innerVal: null,
            flag: true
        };
    }
}
