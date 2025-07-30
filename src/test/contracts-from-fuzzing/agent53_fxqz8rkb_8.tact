trait AbstractFee {
    abstract const DEV_FEE: Int;
}

contract AbstractTest with AbstractFee {
    override const DEV_FEE: Int = ton("1000");

    receive() {
        let fee: Int = self.DEV_FEE;
    }
}
