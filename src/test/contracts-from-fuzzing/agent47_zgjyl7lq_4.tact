trait A {
    virtual fun m(x: Int): Int {
        return x + 10;
    }
}

trait B with A {
    override fun m(x: Int): Int {
        return x * 3;
    }
}

contract D() with B {
    get fun test(): Int {
        return self.m(2);
    }
}
