trait T {
    const X: Int = 10;
}

contract C() with T {
    // Attempt to override a non-virtual trait constant should be rejected
    override const X: Int = 20;

    get fun result(): Int {
        return self.X;
    }
}
