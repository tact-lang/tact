trait V {
    virtual const Y: Int = 123;
}

contract VTest() with V {
    fun test(): Int {
        return self.Y; // should be 123
    }
    
    receive() {
        self.test();
    }
}
