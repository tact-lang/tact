struct Inner {
    val: Int?;
}

struct Outer {
    nestedOpt: Inner?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            nestedOpt: Inner{
                val: null,
            },
        };
    }
}