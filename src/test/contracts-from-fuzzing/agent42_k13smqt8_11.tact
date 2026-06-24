trait A {
    virtual fun foo(): Int {
        return 1;
    }
}

trait B with A {}

trait C with A {}

contract Test() with B, C {
    receive() {
        dump(self.foo());
    }
}
