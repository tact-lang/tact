trait MyTrait {
    virtual const MY_FEE: Int = 10;
}

contract Test with MyTrait {
    override const MY_FEE: Int = 5;

    receive() {
        let fee: Int = self.MY_FEE;
    }
}
