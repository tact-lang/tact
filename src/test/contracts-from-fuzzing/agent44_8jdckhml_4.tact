trait T1 {
    abstract const X: Int;
}

trait T2 {
    abstract const X: Int;
}

contract C() with T1, T2 {
    override const X: Int = 42;

    receive() {
        dump(self.X);
    }
}
