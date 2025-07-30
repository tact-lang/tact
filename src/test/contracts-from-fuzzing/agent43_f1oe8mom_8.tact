trait A {
    virtual fun v(): Int {
        return 5;
    }
}

trait B with A {
    override fun v(): Int {
        return 10;
    }
}

trait C with A {
    override fun v(): Int {
        return 20;
    }
}

contract TestMultiple() with B, C {
    // Due to multiple inheritance conflict, we override v() explicitly
    override fun v(): Int {
        return 30;
    }
    
    receive() {
        let x = self.v();
        require(x == 30, "TestFailed");
        dump(x);
    }
}
