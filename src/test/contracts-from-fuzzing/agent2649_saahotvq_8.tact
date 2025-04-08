struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract OptionalInnerTest {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            innerOpt: null,
        };
    }
}