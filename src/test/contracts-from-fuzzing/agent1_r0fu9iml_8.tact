trait Fee {
    virtual const FEE: Int = ton("1");
}

contract ContractFee with Fee {
    override const FEE: Int = ton("0.5");

    receive() {
        let fee: Int = self.FEE;
    }
}
