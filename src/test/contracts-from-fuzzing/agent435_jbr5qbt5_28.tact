// Contract with optional struct with default null, replaced in init
struct Inner {
    foo: Int;
}

contract TestContract {
    mopt: Inner? = null;
    init() {
        self.mopt = Inner{ foo: 42 };
    }
}
