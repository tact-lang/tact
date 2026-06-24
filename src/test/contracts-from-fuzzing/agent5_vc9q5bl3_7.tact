trait Base {
    fun baseFun(): Int {
        return 1;
    }
    
    virtual fun common(): Int {
        return 100;
    }
}

trait Derived with Base {
    override fun common(): Int {
        return 200;
    }
}

contract C() with Derived {
    fun test(): Int {
        // Expected: baseFun() returns 1, common() returns 200, so result is 201
        return self.baseFun() + self.common();
    }
    
    receive() {
        self.test();
    }
}
