trait FeeTrait {
    abstract const MY_DEV_FEE: Int;
}

contract FeeContract with FeeTrait {
    override const MY_DEV_FEE: Int = 1000;

    receive() {
        self.MY_DEV_FEE;
    }
}
