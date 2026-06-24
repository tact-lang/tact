trait T1 {
    // Trait with a persistent field x
    x: Int;
    fun getX_T1(): Int { return self.x; }
}

trait T2 {
    // Another trait with a persistent field x
    x: Int;
    fun getX_T2(): Int { return self.x; }
}

// Contract C must resolve the conflict of 'x' from both traits by providing its own x
contract C(x: Int) with T1, T2 {
    // Since both traits declared x, the contract provides one x field
    // The contract parameter 'x' will be used for both traits' x
    receive() {
        // Calling both trait methods; they should return the same value
        let a = self.getX_T1();
        let b = self.getX_T2();
        dump(a + b);
    }
}

contract Main() {
    receive() {
        // For testing purpose, do nothing
        cashback(sender());
    }
}
