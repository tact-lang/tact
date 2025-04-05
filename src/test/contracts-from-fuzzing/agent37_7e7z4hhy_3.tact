trait MyConstTrait {
    virtual const defaultValue: Int = 5;
}

contract ConstTest() with MyConstTrait {
    override const defaultValue: Int = 15;

    receive() {
        dump(self.defaultValue); // Expected output: 15
        cashback(sender());
    }
}
