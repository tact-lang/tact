trait X {
    virtual fun f(): Int { return 100; }
}

trait Y {
    virtual fun f(): Int { return 200; }
}

contract C() with X, Y {
    override fun f(): Int { return 300; }
    receive() {
        dump(self.f());
    }
}
