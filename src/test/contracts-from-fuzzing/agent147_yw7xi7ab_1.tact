struct Outer { inner: Inner; }
struct Inner { value: Int; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ value: 123 } };
    }
}