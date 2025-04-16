trait ConstTrait {
    virtual const X: Int = 123;
    fun getX(): Int {
         return self.X;
    }
}

contract ConstContract() with ConstTrait {
    override const X: Int = 456;
    receive() {
         dump(self.getX());
         cashback(sender());
    }
}
