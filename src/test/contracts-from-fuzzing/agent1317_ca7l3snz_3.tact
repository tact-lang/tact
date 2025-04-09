struct OptionalNested {
    x: Int;
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    y: Bool;
}

contract OptionalFieldTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            x: 123,
            innerOpt: InnerOpt{ y: true }
        };
    }
}