trait T {
    // Wildcard used in trait virtual function parameter, legal for discarding
    virtual fun val(_: Int): Int { return 42; }
}

contract Test with T {
    // Override using proper identifier instead of wildcard
    override fun val(x: Int): Int {
         return x;
    }
    receive() {
         dump(self.val(9));
    }
}
