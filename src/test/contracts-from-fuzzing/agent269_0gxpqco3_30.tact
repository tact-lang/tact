struct X1 { x: Int = 1; }
struct X2 { x: X1 = X1{}; }
struct X3 { x: X2 = X2{}; }
struct X4 { x: X3 = X3{}; }
struct X5 { x: X4 = X4{}; }

contract OptDeepChain {
    val: X5? = null;

    init() {
        self.val = X5{ x: X4{ x:X3{ x:X2{ x:X1{ x:5 } } } } };
    }
}