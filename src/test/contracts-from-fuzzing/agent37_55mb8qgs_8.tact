struct OptNested {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    amount: Int?;
}

contract OptionalNestedTest {
    data: OptNested;

    init() {
        self.data = OptNested{
            innerOpt: Inner{ flag:true, amount: null }
        };
    }
}
