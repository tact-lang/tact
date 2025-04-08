struct Nested {
    i: Int;
    flag: Bool;
    inner: Inner;
}

struct Inner {
    text: String;
    num: Int;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            i: 1,
            flag: true,
            inner: Inner{
                text: "abc",
                num: 2,
            },
        };
    }
}