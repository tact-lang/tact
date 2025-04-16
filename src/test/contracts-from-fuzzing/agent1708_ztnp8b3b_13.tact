struct Inner { x: Int? = null; y: Bool? = null; }

struct Outer { nested: Inner? = null; }

contract TestContract {
    val: Outer = Outer{ nested: null };

    init() {}
}
