trait X {
    fun foo(): Int {
        return 10;
    }
}

trait Y {
    fun foo2(): Int {
        return 20;
    }
}

contract D() with X, Y {
    receive() {
        let sum = self.foo() + self.foo2();
        let _ = sum;
        cashback(sender());
    }
}
