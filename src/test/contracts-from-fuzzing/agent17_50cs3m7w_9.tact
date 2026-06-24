trait Treasure {
    virtual const ENABLE_TIMELOCK: Bool = true;
    
    // This function would be compile-time optimized if ENABLE_TIMELOCK is false
    fun checkLock(): Int {
        if (self.ENABLE_TIMELOCK) {
            return 1;
        } else {
            return 0;
        }
    }
}

contract TestLock with Treasure {
    override const ENABLE_TIMELOCK: Bool = false;

    receive() {
        let result: Int = self.checkLock();
    }
}
