struct Inner { x: Int = 5; y: Bool = true }
struct Outer { inner: Inner; z: String = "default" }

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{},
            z: "hello"
        };
    }
}