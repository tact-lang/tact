trait T1 {
    virtual const N: Int = 10;
}

trait T2 {
    virtual const N: Int = 20;
}

contract C() with T1, T2 {
    // Resolving the conflict by explicitly overriding
    override const N: Int = 30;

    receive() {
        dump(self.N);
    }
}
