struct NestedOptional {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract NestedOptionalContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: InnerOpt{ val: null }
        };
    }
}