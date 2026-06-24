struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Outer {
    inner: Inner;
    txt: String?;
    flag: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                val1: 42,
                val2: true,
            },
            txt: "hi",
            flag: false,
        };
    }
}