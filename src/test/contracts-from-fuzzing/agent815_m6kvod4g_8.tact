struct InnerOpt {
    foo: Int;
}

struct Holder {
    nestedOpt: InnerOpt?;
}

contract OptionalNested {
    val: Holder;

    init() {
        self.val = Holder{
            nestedOpt: InnerOpt{foo: 42}
        };
    }
}