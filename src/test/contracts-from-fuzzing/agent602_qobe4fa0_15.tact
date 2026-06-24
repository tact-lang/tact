struct X1 { f: Int }
struct X2 { f: X1 }
struct X3 { f: X2 }
struct X4 { f: X3 }
struct X5 { f: X4 }
struct X6 { f: X5 }
struct X7 { f: X6 }

contract TestContract {
    val: X7;

    init() {
        self.val = X7{ f:X6{ f:X5{ f:X4{ f:X3{ f:X2{ f:X1{ f:42 } } } } } } };
    }
}