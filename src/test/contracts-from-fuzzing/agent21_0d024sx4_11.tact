trait X {
    abstract const A: Int;
}

trait Y {
    abstract const A: Int;
}

contract C() with X, Y {
    override const A: Int = 123;
    receive() {
        dump(self.A);
        cashback(sender());
    }
}
