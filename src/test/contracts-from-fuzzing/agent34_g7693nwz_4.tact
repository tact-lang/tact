trait X {
    virtual fun f(x: Int): Int {
        return x + 1;
    }
}

trait Y with X {
    override fun f(x: Int): Int {
        return x + 3;
    }
}

contract Z() with X, Y {
    get fun test(): Int {
        return self.f(4);
    }
}
