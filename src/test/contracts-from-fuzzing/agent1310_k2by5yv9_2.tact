struct Inner { foo: Int; }
struct Outer { nested: Inner?; }

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{ nested: null };
    }
}
