struct Inner {
    val: Int as int64;
    flag: Bool?;
}

struct Outer {
    inner: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                val: 42,
                flag: null
            }
        };
    }
}
