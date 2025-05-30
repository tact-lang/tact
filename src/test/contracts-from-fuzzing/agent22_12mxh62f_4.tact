trait T1 {
    virtual fun foo(): Int { return 10; }
}

trait T2 {
    virtual fun foo(): Int { return 20; }
}

contract X() with T1, T2 {
    override fun foo(): Int { return 100; }

    receive() {
        dump(self.foo());
    }
}
