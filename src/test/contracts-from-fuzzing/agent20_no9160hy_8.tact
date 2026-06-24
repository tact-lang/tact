contract TestReturnFixed {
    fun testReturn(): Int {
        return 42;
    }

    receive() {
        let r: Int = self.testReturn();
        dump(r);
    }
}
