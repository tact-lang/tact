struct Inner {
    ib: Bool;
    inum: Int;
}

struct Outer {
    val1: Int;
    flag: Bool;
    inner: Inner;
}

contract NestedFields {
    data: Outer;

    init() {
        self.data = Outer{
            val1: 42,
            flag: true,
            inner: Inner{
                ib: false,
                inum: 15,
            }
        };
    }
}