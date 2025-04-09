trait T {
    virtual fun bar(): Int {
        return 7;
    }
}

contract D() with T {
    receive() {
        // Calling the virtual function that has not been overridden in the contract
        dump(self.bar());
    }
}
