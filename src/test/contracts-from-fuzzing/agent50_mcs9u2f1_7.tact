trait A {
    virtual fun f(): Int {
        return 10;
    }
}

contract B() with A {
    override fun f(): Int {
        return 20;
    }

    receive() {
        dump(self.f()); // expected output: 20
    }
}
