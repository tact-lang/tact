trait A {
    virtual fun f(): Int {
        return 1;
    }
}

trait B {
    virtual fun g(): Int {
        return 2;
    }
}

contract Y() with A, B {
    receive() {
        dump(self.f() + self.g()); // expected output: 3
    }
}
