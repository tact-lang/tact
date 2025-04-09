struct Inner {
    s: String;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract NestedWithExtraTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                s: "abc",
                b: true,
            },
            flag: false
        };
    }
}
