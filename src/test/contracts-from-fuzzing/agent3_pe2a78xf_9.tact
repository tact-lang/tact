trait TConst {
    const A: Int = 10;
    fun getA(): Int { return self.A; }
}

contract TestContract() with TConst {
    override const A: Int = 20;
    
    receive() {
         dump(self.getA());
    }
}
