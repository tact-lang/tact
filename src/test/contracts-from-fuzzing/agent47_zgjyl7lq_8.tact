trait ConstTest {
    // Virtual constant with default 10
    virtual const V: Int = 10;

    // Function that returns the constant V
    fun getV(): Int {
        return self.V;
    }
}

contract TestOverridingConst() with ConstTest {
    // Override the virtual constant with 20
    override const V: Int = 20;

    // Getter function that returns getV()
    get fun test(): Int {
        return self.getV();
    }
}
