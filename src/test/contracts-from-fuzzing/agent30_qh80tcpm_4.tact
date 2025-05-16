trait T {
    abstract const a: Int;
}

contract C() with T {
    override const a: Int = 42;
    
    receive() {
        dump(self.a);
        cashback(sender());
    }
}
