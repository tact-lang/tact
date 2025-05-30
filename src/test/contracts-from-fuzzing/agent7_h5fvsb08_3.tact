struct Result {
    a: Int;
    b: Int;
}

trait MyTrait {
    abstract fun f(): Int;
    virtual fun g(): Int {
        return 1;
    }
}

contract TestContract() with MyTrait {
    override fun f(): Int { return 42; }
    override fun g(): Int { return 24; }

    get fun out(): Result {
        return Result{ a: self.f(), b: self.g() };
    }

    receive() {
        // empty receiver
    }
}
