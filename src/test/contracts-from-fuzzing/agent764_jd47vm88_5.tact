struct NestedOptionals {
    innerOpt: Inner?;
    innerPlain: Inner;
}

struct Inner {
    foo: Int?;
    bar: Bool;
}

contract MixNestedOptional {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            innerOpt: null,
            innerPlain: Inner{ foo: null, bar: true }
        };
    }
}