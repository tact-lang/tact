trait T {
    inline fun f(): Int {
        return 5;
    }
}

contract C() with T {
    receive() {
        let x = self.f(); // expected x = 5
        if (x != 5) { throw(1); }
        cashback(sender());
    }
}
