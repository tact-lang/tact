struct Results {
    f: Int;
    v: Int;
    g: Int;
    A: Int;
    B: Int;
}

trait T1 {
    // Abstract function must be implemented by inheritors
    abstract fun f(x: Int): Int;

    // Virtual function with a default implementation
    virtual fun v(x: Int): Int {
        return x + 1;
    }

    // Abstract constant that must be overridden
    abstract const A: Int;

    // Virtual constant with a default value
    virtual const B: Int = 10;
}

trait T2 {
    // Another virtual function in a separate trait
    virtual fun g(x: Int): Int {
        return x - 1;
    }
}

// Contract that composes traits T1 and T2
contract TestContract(dummy: Int) with T1, T2 {
    // Override abstract function from T1
    override fun f(x: Int): Int {
        return x * 2;
    }

    // Override virtual function from T1
    override fun v(x: Int): Int {
        return x * 3;
    }

    // Override virtual function from T2
    override fun g(x: Int): Int {
        return x * 4;
    }

    // Override abstract constant from T1
    override const A: Int = 7;
    // Optionally override virtual constant from T1
    override const B: Int = 30;

    // A getter function to test the behavior at runtime
    get fun results(): Results {
        return Results{
            f: self.f(2),     // expected 4
            v: self.v(2),     // expected 6
            g: self.g(2),     // expected 8
            A: self.A,        // expected 7
            B: self.B         // expected 30
        };
    }

    // A receiver function to trigger execution of results()
    receive("test") {
        let _ = self.results();
        cashback(sender());
    }
}
