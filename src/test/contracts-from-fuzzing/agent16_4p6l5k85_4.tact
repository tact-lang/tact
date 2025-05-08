trait VirtualTrait {
    virtual const defaultValue: Int = 10;
    fun multiply(a: Int): Int {
         return a * self.defaultValue;
    }
}

contract Tester() with VirtualTrait {
    receive() {
         dump(self.multiply(5)); // Expected output: 50
    }
}
