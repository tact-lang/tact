trait Dyn {
    // Abstract function f, to be implemented by the contract
    abstract fun f(): Int;

    // Default implementation of g calls f() and multiplies by 2
    fun g(): Int {
        return self.f() * 2;
    }
}

contract CDyn() with Dyn {
    // Provide implementation for the abstract function
    override fun f(): Int {
        return 11;
    }

    // Getter that returns the result from g(); expected 11 * 2 = 22
    get fun result(): Int {
        return self.g();
    }

    receive() {
        let _ = self.result();
        cashback(sender());
    }
}
