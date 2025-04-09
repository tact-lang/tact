struct NestedOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract TestNestedOptional {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null
        };
    }
}