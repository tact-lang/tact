struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    x: Int;
    s: String;
    flag: Bool;
}

contract TestContract {
    n: NestedOptional;

    init() {
        self.n = NestedOptional{
            inner: Inner{ x: 1, s: "str", flag: true }
        };
    }
}