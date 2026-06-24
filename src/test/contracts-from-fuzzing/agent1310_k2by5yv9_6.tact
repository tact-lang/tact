struct Inner { val: Int; }
struct Outer { nested: Inner; }

contract TestContract {
    field: Outer?;

    init() {
        self.field = null;
    }
}
