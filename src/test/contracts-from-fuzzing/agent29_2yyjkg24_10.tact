trait Base {
    fun f(): Int { return 0; }
}

trait Left with Base {
    override fun f(): Int { return 1; }
}

trait Right with Base {
    override fun f(): Int { return 2; }
}

contract Diamond() with Left, Right {
    override fun f(): Int { return 42; }

    receive() {
        let x = self.f();
        dump(x);
        cashback(sender());
    }
}
