struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    deep: Deeper?;
}

struct Deeper {
    val: Int;
}

contract OptionalNest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null
        };
    }
}