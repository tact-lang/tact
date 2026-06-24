struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    deep: Deeper?;
}

struct Deeper {
    val: Int;
}

contract NestedOptTest {
    d: NestedOptional;

    init() {
        self.d = NestedOptional{
            inner: Inner{
                deep: null
            }
        };
    }
}