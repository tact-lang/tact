struct Inner {
    str: String;
    flag: Bool;
}

struct Outer {
    i: Int;
    inner: Inner?;
}

contract NestedOptionalRef {
    data: Outer;

    init() {
        self.data = Outer{
            i: 5,
            inner: Inner{
                str: "hello",
                flag: true
            }
        };
    }
}