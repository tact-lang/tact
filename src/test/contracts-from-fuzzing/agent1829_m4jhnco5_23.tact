struct Inner { x: Int; }
struct Outer { inner: Inner?; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 42 }
        };
    }
}