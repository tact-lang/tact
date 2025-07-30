struct NestedOptionals {
    innerOpt: Inner?;
}

struct Inner {
    nestedOpt: Deeper?;
}

struct Deeper {
    deepValue: Int?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            innerOpt: Inner{
                nestedOpt: Deeper{
                    deepValue: null
                }
            }
        };
    }
}