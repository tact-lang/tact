struct Calc {
    a: Int = 100 + 23 * 3;
    b: Int = (7 * 6) - (1 + 2);
    c: Int = pow(2,8); // compile-time pow
}

contract TestContract {
    val: Calc;
    init() { self.val = Calc{}; }
}