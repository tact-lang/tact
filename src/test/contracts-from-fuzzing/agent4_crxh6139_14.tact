extends fun double(self: Int): Int {
    return self + self;
}

contract DoubleTest() {
    receive() {
        let result = (5).double();
        require(result == 10, "Double extension failed");
        cashback(sender());
    }
}
