// multiple optional nested across several structs
struct X1 { a: Int?; }
struct X2 { x1: X1?; }
struct X3 { x2: X2?; }

contract Test28 {
    val: X3;
    init() {
        self.val = X3{ x2: null };
    }
}