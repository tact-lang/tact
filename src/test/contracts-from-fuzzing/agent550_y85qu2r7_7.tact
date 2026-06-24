struct InnerMost { val: Int; }

struct Inner {
    val: Int;
    opt: InnerMost?;
}

contract NestedOptionals {
    i: Inner?;

    init() {
        self.i = null;
    }
}