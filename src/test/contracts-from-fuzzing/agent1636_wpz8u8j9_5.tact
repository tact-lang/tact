struct Inner {
    val: Int;
}

struct Outer {
    opt_inner: Inner?;
}

contract TestOptStruct {
    data: Outer;

    init() {
        self.data = Outer{
            opt_inner: null
        };
    }
}
