trait T1 {
    a: Int;
}

trait T2 {
    a: Int;
}

contract C(a: Int) with T1, T2 {
    // No init() function is declared because contract parameters are provided
    receive() {
        dump(self.a);
        cashback(sender());
    }
}
