struct Inner { x: Int }
struct Outer { inner: Inner }

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{ inner: Inner{ x: 1 } };
    }
}