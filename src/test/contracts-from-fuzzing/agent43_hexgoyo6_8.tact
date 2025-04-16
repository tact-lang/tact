trait WithBase with BaseTrait {
    fun getReserve(): Int {
        return self.storageReserve;
    }
}

contract TestWithBase() with WithBase {
    receive() {
        dump(self.getReserve()); // Expected to output 0 by default
    }
}
