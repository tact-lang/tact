struct NestedOptional {
    val: Int?;
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    number: Int?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            val: null,
            inner: Inner{
                flag: true,
                number: null
            }
        };
    }
}
