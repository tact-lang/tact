trait A {
    virtual fun foo(): Int {
        return 10;
    }
}

trait B with A {
    // Inherits foo from A
}

trait C with A {
    // Inherits foo from A
}

contract D() with B, C {
    receive() {
        dump(self.foo());
    }
}
