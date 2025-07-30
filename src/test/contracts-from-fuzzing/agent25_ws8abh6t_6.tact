trait T {
    a: Int;
    fun getA(): Int { return self.a; }
}

// Contract C uses contract parameters to initialize the trait field 'a'
contract C(a: Int) with T {
    // No additional init needed because 'a' is provided as a contract parameter
    receive() {
        dump(self.getA());
    }
}

contract Main() {
    receive() {
        // For testing purposes, nothing is done
        cashback(sender());
    }
}
