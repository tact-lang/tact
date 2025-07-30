// contract with mixture of primitive optional and nested struct optional
struct Inner { x: Int; }

contract TestContract {
    a: Int?;
    b: Inner?;

    init() {
        self.a = null;
        self.b = null;
    }
}
