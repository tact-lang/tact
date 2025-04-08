struct Foo {
    val: Int;
}

struct Wrap {
    inner: Foo? = null;
    label: String;
}

contract TestContract {
    w: Wrap;

    init() {
        self.w = Wrap{ label: "x" };
    }
}