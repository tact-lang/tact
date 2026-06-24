struct InnerOpt {
    val: Int?;
}

struct Outer {
    inner: InnerOpt?;
}

contract NestedOptionalStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}