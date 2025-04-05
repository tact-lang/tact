contract ChainTest {
    // A chain of function calls
    fun a(x: Int): Int {
        return self.b(x + 1);
    }

    fun b(x: Int): Int {
        return self.c(x + 1);
    }

    fun c(x: Int): Int {
        return x + 1;
    }

    receive() {
        // Start the chain using self.a()
        let result: Int = self.a(1);
    }
}
