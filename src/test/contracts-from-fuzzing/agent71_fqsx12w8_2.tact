trait MyVirtualTrait {
    virtual fun greet(): String {
        return "Hello";
    }
}

contract TestVirtual() with MyVirtualTrait {
    override fun greet(): String {
        return "Hi";
    }

    receive() {
        let res = self.greet();
        dump(res);
        cashback(sender());
    }
}
