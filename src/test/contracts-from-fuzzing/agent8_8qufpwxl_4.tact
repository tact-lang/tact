trait Base {
    virtual fun compute(): Int {
        return 1;
    }
}

trait Left with Base {
    override fun compute(): Int {
        return 2;
    }
}

trait Right with Base {
    override fun compute(): Int {
        return 3;
    }
}

// This contract does not override compute(), which should lead to a conflict
contract DiamondFail() with Left, Right {
    receive() {
        let a = self.compute();
        return;
    }
}
