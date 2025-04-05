trait T1 {
    abstract const VALUE: Int;
    fun getVal(): Int { return self.VALUE; }
}

trait T2 {
    virtual const VALUE: Int = 10;
}

contract C() with T1, T2 {
    // Overriding the abstract constant from T1 and virtual constant from T2
    override const VALUE: Int = 20;

    receive() {
        let a = self.getVal();
        dump(a);
    }
}

contract Main() {
    receive() {
        cashback(sender());
    }
}
