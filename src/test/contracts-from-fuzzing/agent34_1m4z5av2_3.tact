trait A {
    virtual fun bar(): Int {
        return 1;
    }
}

trait B {
    virtual fun bar(): Int {
        return 2;
    }
}

contract C() with A, B {
    override fun bar(): Int {
        return 3;
    }

    receive() {
        let result = self.bar();
        let _ = result + 0;
        cashback(sender());
    }
}
