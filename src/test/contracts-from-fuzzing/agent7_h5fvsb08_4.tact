struct Res {
    f_val: Int;
    g_val: Int;
    X_val: Int;
    Y_val: Int;
}

trait A {
    abstract fun f(): Int;
    virtual fun g(): Int {
        return 100;
    }

    abstract const X: Int;
    virtual const Y: Int = 200;
}

contract Test() with A {
    override fun f(): Int { return 1; }
    override const X: Int = 42;
    override const Y: Int = 84;

    get fun out(): Res {
        return Res{ f_val: self.f(), g_val: self.g(), X_val: self.X, Y_val: self.Y };
    }

    receive() {
        // empty receiver
    }
}
