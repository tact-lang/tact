struct Inner { x: Int = 7; y: String = "hello" }
struct Outer { foo: Int = 42; inner: Inner }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ inner: Inner{} };
    }
}