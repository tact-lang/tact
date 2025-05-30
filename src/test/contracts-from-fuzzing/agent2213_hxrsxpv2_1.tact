struct Nested {
    inner: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    field: Nested;

    init() {
        self.field = Nested{
            inner: Inner{
                val: 1,
                flag: true,
            },
        };
    }
}
