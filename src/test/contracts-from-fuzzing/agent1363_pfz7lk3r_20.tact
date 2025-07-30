struct MultipleNestedOptionals {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract MultiOptionTest {
    storage: MultipleNestedOptionals;

    init() {
        self.storage = MultipleNestedOptionals{
            inner1: null,
            inner2: InnerOpt{foo:123, bar:false},
        };
    }
}