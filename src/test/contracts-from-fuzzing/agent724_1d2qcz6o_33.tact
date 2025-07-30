struct Inner {
    val: Int? = null;
}

contract TestContract {
    foo: Inner? = null;

    init() {
        self.foo = null;
    }
}