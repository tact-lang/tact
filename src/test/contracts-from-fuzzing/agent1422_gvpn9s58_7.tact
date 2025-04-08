struct OptNested {
    inner: Inner?;
}

struct Inner {
    foo: Int;
}

contract OptContract {
    val: OptNested;
    init() {
        self.val = OptNested{ inner: null };
    }
}