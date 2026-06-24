trait MyConstTrait {
    virtual const V: Int = 42;
}

contract TestConst() with MyConstTrait {
    override const V: Int = 100;

    get fun getV(): Int {
        return self.V;
    }

    receive() {
        let v = self.getV();
        dump(v);
        cashback(sender());
    }
}
