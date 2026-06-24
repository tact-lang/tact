trait A {
    // Concrete trait-level constant
    const X: Int = 10;
}

trait B {
    // Concrete trait-level constant
    const Y: Int = 20;
}

contract C() with A, B {
    receive() {
        // Sum of trait-level constants should be 30
        dump(self.X + self.Y);
        cashback(sender());
    }
}
