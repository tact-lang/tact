trait T1 {
    abstract fun f(x: Int): Int;
}

trait T2 {
    abstract fun f(x: Int): Int;
}

contract D with T1, T2 {
    override fun f(x: Int): Int {
        return x + 1;
    }
    
    receive() {
        let r = self.f(5); // expected: 6
        dump(r);
        cashback(sender());
    }
}
