trait TraitX {
    // Virtual constant with default value
    virtual const Y: Int = 100;

    // A function that uses the constant Y
    fun calc(): Int {
        return self.Y + 50;
    }
}

contract TestX() with TraitX {
    // Override constant Y
    override const Y: Int = 200;

    receive() {
        let r = self.calc();
        require(r == 250, "TestFailed");
        dump(r);
    }
}
