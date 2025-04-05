trait T {
    // A simple trait with a persistent state variable
    x: Int;
}

// Contract using contract parameter syntax to satisfy the trait's state variable requirement
contract C(x: Int) with T {
    // No init() function provided; the value for x is taken from deployment parameter
    receive() {
        dump(self.x); // Expected output: same as provided parameter x
    }
}
