trait A {
    abstract const value: Int;
}

trait B {
    abstract const value: Int;
}

contract C() with A, B {
    override const value: Int = 10;

    receive() {
        dump(self.value);
        cashback(sender());
    }
}
