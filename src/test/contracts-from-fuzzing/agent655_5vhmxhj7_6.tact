struct WithOptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    num: Int;
    txt: String;
}

contract TestContract {
    field: WithOptionalNested;

    init() {
        self.field = WithOptionalNested{
            innerOpt: Inner{
                num: 99,
                txt: "hello",
            }
        };
    }
}
