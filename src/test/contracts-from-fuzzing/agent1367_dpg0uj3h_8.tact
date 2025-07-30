struct NestedEmptyOptionals {
    foo: InnerFoo;
}

struct InnerFoo {
    bar: InnerBar;
}

struct InnerBar {
    val: Int?;
}

contract NestedNulls {
    test: NestedEmptyOptionals;

    init() {
        self.test = NestedEmptyOptionals{
            foo: InnerFoo{
                bar: InnerBar{
                    val: null,
                },
            },
        };
    }
}