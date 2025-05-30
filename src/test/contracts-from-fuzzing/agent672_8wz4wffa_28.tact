struct X1 { x: Int }
struct X2 { x: X1 }
struct X3 { x: X2 }
struct X4 { x: X3 }
struct X5 { x: X4 }
struct X6 { x: X5 }

contract DeepOptionalChain {
    foo: X6?;

    init() {
        self.foo = null;
    }
}