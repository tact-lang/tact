trait TraitC {
    virtual const number: Int = 100;
}

contract Test2() with TraitC {
    override const number: Int = 200;

    receive() {
        dump(self.number);
        cashback(sender());
    }
}
