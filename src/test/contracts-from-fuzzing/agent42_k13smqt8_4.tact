trait A {
    virtual fun f(): Int {
        return 1;
    }
}

trait B {
    virtual fun f(): Int {
        return 2;
    }
}

contract Test() with A, B {
    // Correctly override the conflict from traits A and B
    override fun f(): Int {
        // Option 1: simply sum the expected values
        return 1 + 2;
    }
    
    receive() {
        dump(self.f());
    }
}
