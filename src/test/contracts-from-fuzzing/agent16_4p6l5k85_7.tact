trait T1 {
    virtual const X: Int = 100;
}

trait T2 {
    virtual const X: Int = 200;
}

contract C() with T1, T2 {
    // Resolve the conflict by overriding the constant
    override const X: Int = 300;

    receive() {
         dump(self.X); // Expected to dump 300
    }
}
