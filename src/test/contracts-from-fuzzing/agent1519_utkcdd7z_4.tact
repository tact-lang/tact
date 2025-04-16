struct NestedOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    value: Int?;
}

contract HasNestedOptionals {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: InnerOpt{
                flag: true,
                value: null
            }
        };
    }
}