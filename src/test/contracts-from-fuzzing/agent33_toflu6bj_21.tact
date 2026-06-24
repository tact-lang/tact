struct Inner { x: Int; y: Bool; }
struct Outer { inner: Inner; z: Int; }

contract TestContract {
    storage: Outer;

    init() {
        let inner: Inner = Inner{ x: 7, y: false };
        let z: Int = 42;
        self.storage = Outer{ inner, z };
    }
}