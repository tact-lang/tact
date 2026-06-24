trait Base {
    virtual fun f(): Int {
        return 1;
    }
}

trait Left with Base {
    override fun f(): Int {
        return 2;
    }
}

trait Right with Base {
    override fun f(): Int {
        return 3;
    }
}

contract Diamond() with Left, Right {
    override fun f(): Int {
        // Resolve diamond conflict by explicitly overriding.
        // Here we simply add the intended outputs from Left and Right.
        return 2 + 3;
    }

    receive() {
        dump(self.f()); // Expected output: 5
    }
}
