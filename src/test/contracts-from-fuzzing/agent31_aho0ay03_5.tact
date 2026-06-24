struct NestedOptionals {
    nestedOpt: Inner?;
}

struct Inner {
    moreOpt: Int?;
}

contract TestContract {
    val: NestedOptionals?;

    init() {
        self.val = null;
    }
}
