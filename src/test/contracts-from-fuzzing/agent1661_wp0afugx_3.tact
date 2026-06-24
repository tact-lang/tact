struct Inner {
    flag: Bool;
    value: Int?;
    desc: String;
}

struct Outer {
    inner: Inner;
    note: String;
    num: Int;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                value: null,
                desc: "deep"
            },
            note: "level",
            num: 123
        };
    }
}