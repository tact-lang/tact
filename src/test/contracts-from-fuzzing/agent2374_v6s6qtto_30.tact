struct X1 { a: Int }
struct X2 { s: X1 }
struct X3 { s: X2 }
struct X4 { s: X3 }
struct X5 { s: X4 }

contract DeepNestTest {
    d: X5;

    init() {
        self.d = X5{ s: X4{ s: X3{ s: X2{ s: X1{a:5} } } } };
    }
}