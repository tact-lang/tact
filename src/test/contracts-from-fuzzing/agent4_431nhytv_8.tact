contract Test {
    const A: Int = 10;
    
    // Persistent state field initialized from constant A
    x: Int = self.A;

    receive() {
        // Use constant in a compile-time conditional check
        if (self.A > 5) {
            // branch that should be kept if true; note: constant value 10 so compile-time constant propagation might occur
        } else {
            // unreachable branch
        }
    }
}
