trait MyTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract TestVirtual with MyTrait {
    override const MY_FEE: Int = ton("0.5");

    receive() {
        if (self.MY_FEE < ton("1.0")) {
            // Virtual constant override works
        }
    }
}
