struct NestingWithOptional {
    innerOpt: Inner?;
}

struct Inner {
    innerMostOpt: InnerMost?;
}

struct InnerMost {
    value: Int;
}

contract NestedOptionals {
    data: NestingWithOptional;

    init() {
        self.data = NestingWithOptional{
            innerOpt: Inner{
                innerMostOpt: InnerMost{
                    value: 77
                }
            }
        };
    }
}