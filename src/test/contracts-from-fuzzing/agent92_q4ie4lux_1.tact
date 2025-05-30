contract TestPrimitive() {
    fun test() {
        let a: Int = 1 + 2;
        dump(a); // Expect output: 3
    }
    receive() {
        cashback(sender());
    }
}

// Trigger the test function (in real deployment, the function can be called off-chain)
