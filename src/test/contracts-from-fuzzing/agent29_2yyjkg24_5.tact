trait AbstractTrait {
    abstract fun bar(): Int;
}

contract Test3() with AbstractTrait {
    override fun bar(): Int { return 99; }

    receive() {
        let x = self.bar();
        dump(x);
        cashback(sender());
    }
}
