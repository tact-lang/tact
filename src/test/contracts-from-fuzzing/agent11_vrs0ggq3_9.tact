trait AbstractTrait {
    abstract const MY_DEV_FEE: Int;
}

contract Concrete with AbstractTrait {
    override const MY_DEV_FEE: Int = ton("1000");

    receive() {
        let fee: Int = self.MY_DEV_FEE;
    }
}
