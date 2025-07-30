struct X1 { f: Int }
struct X2 { x1: X1 }
struct X3 { x2: X2 }
struct X4 { x3: X3 }
struct X5 { x4: X4 }
contract Depth5 {
    data: X5;
    init() {
        self.data = X5{ x4: X4{ x3: X3{ x2: X2{ x1: X1{ f: 17 } } } } };
    }
}