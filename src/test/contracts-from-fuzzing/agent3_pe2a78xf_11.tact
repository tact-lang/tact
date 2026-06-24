trait Base {
    virtual fun greet(): Int { return 0; }
}

trait Left with Base {
    override fun greet(): Int { return 1; }
}

trait Right with Base {
    override fun greet(): Int { return 2; }
}

contract Diamond() with Left, Right {
    // Overriding greet to resolve conflict in diamond inheritance
    override fun greet(): Int { return 42; }
    
    receive() {
        dump(self.greet());
    }
}
