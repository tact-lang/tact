trait MyAbstract {
    abstract const VAL: Int;
}

contract Test with MyAbstract {
    override const VAL: Int = 5;

    receive() {
        let x: Int = self.VAL + 10;
    }
}
