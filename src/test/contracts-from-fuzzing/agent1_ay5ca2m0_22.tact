struct LongNestedOptionals {
    nested1: InnerOpt?;
    nested2: InnerOpt?;
    nested3: InnerOpt?;
    nested4: InnerOpt?;
    nested5: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}

contract ManyNestedOptionals {
    data: LongNestedOptionals;

    init() {
        self.data = LongNestedOptionals{
            nested1: null,
            nested2: null,
            nested3: null,
            nested4: null,
            nested5: null
        };
    }
}
