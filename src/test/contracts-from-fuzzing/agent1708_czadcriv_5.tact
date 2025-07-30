struct OptionalNested {
    inner: Inner?;
    val: Int;
}

struct Inner {
    s: String?;
    n: Int?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: Inner{
                s: null,
                n: null
            },
            val: 42
        };
    }
}