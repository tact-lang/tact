struct NestedOptional {
    outer: Int?;
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    sub: SubInner?;
}

struct SubInner {
    val: String;
}

contract TestContract {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            outer: 42,
            inner: Inner{
                flag: true,
                sub: SubInner{
                    val: "hello"
                }
            },
        };
    }
}