struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner?;
}

contract DeepOptionalContract {
    deep: Outer?;

    init() {
        self.deep = null;
    }
}