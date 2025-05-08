trait AbstractTrait {
    abstract const MY_DEV_FEE: Int;
}

contract TestAbstract with AbstractTrait {
    override const MY_DEV_FEE: Int = ton("100");

    receive() {
        let fee: Int = self.MY_DEV_FEE;
    }
}
