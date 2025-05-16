trait Helper {
    fun add(x: Int, y: Int): Int {
        return x + y;
    }
}

contract ContractA with Helper {
    receive() {
        let res: Int = self.add(2, 3);
        dump(res);
    }
}
