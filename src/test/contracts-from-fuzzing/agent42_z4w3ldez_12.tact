trait A {
    abstract const c: Int;
}

trait B {
    abstract const c: Int;
}

contract C() with A, B {
    override const c: Int = 42;

    receive() {
        dump(self.c);
        cashback(sender());
    }
}
