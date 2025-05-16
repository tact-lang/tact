struct Inner {
    val: Int;
}

struct Outer {
    innerOpt: Inner? = null;
    anotherOpt: Inner?;
}

contract TestOptDefault {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}