struct NestedWithOptionals {
    nestedOpt: NestedInner?;
}

struct NestedInner {
    deeply: DeepInner;
    maybe: Int?;
}

struct DeepInner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: NestedWithOptionals;

    init() {
        self.data = NestedWithOptionals{
            nestedOpt: NestedInner{
                deeply: DeepInner{
                    foo: 1,
                    bar: true
                },
                maybe: null
            }
        };
    }
}