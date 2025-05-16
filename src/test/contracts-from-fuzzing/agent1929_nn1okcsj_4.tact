struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: DeepOpt?;
}

struct DeepOpt {
    a: Int;
    b: String?;
    c: Bool?;
}

contract TestNestedOptionals {
    store: NestedOpt;
    init() {
        self.store = NestedOpt{
            foo: null,
            bar: false,
            baz: DeepOpt{
                a: 99,
                b: null,
                c: true
            }
        };
    }
}