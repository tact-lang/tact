struct Inner { val: Int }
struct Outer { inner: Inner? }

contract NestedOpts {
    storage: Outer?;
    init() {
        self.storage = null;
    }
}