struct Inner {
    val1: Int?;
    val2: Bool?;
}

struct Outer {
    inner: Inner?;
    txt: String?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                val1: null,
                val2: true
            },
            txt: null
        };
    }
}
