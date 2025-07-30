// Contract persistent variables with nested struct with optional defaulted field
struct A {
    x: Int? = null;
    y: Int;
}

contract TestContract {
    f: A;
    init() {
        self.f = A{
            y: 100
        };
    }
}