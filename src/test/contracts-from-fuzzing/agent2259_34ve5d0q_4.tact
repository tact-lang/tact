struct Outer {
    inner: Middle;
    val: Int;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    data: Int?;
    txt: String?;
}

contract NestedMix {
    payload: Outer;

    init() {
        self.payload = Outer{
            inner: Middle{
                inner: Inner{
                    data: null,
                    txt: "hi",
                },
                flag: true
            },
            val: 77
        };
    }
}