contract Test {
    flags: Int as uint256 = 0;
    oneMoreVar: Int = 239;
    receive() {
        self.checkImmediateReturn();
        require(self.flags == 42, "checkImmediateReturn() is mis-compiled");
        self.flags = 0;
        self.checkReturnViaLocalVar();
        require(self.flags == 42, "checkReturnViaLocalVar() is mis-compiled");
    }

    fun checkImmediateReturn(): Bool {
        return self.check();
    }
    fun checkReturnViaLocalVar(): Bool {
        let foo = self.check();
        return foo;
    }
    fun check(): Bool {
        self.flags = 42;
        return true;
    }
}

