trait T1 {
    abstract const VAL: Int;
}

trait T2 {
    abstract const VAL: Int;
}

contract C() with T1, T2 {
    override const VAL: Int = 100;
    
    receive() {
        dump(self.VAL);
    }
}
