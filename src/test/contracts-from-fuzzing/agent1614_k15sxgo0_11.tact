struct X1 { a: Int }
struct X2 { x1: X1 }
struct X3 { x2: X2 }
struct X4 { x3: X3 }
struct X5 { x4: X4 }

contract Test11 {
    value: X5;

    init() {
        self.value = X5{ x4: X4{ x3: X3{ x2: X2{ x1: X1{ a: 77 } } } } };
    }
}