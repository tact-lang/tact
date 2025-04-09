contract TestSha256 {
    // Using sha256 as a compile-time function
    // The expected behavior is that sha256 produces a constant value determinable at compile-time
    const hash: Int = sha256("test");

    get fun getHash(): Int {
        return self.hash;
    }

    receive() {
        cashback(sender());
    }
}
