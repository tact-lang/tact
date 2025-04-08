struct OptionalInner {
    val: Int;
}

struct TestOptionals {
    innerOpt: OptionalInner?;
}

contract OptionalStructContract {
    optionalField: TestOptionals;
    init() {
        self.optionalField = TestOptionals{
            innerOpt: OptionalInner{ val: 99 }
        };
    }
}
