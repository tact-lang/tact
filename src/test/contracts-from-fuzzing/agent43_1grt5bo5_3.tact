trait Wild {
    // Valid: using '_' as a discard parameter in a virtual function
    virtual fun test(_: Int): Int {
        return 1;
    }
}

contract Test with Wild {
    receive() {
        self.test(10);
    }
}
