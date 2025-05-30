trait TA {
    virtual fun foo(): Int { return 10; }
}

trait TB {
    virtual fun foo(): Int { return 20; }
}

contract TC() with TA, TB {
    override fun foo(): Int {
        return 30;
    }

    receive() {
        let x = self.foo();
        dump(x);
    }
}
