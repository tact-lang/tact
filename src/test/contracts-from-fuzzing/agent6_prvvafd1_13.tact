extends fun myDouble(self: Int): Int {
    return self * 2;
}

contract TestContract() {
    receive() {
        let res = 5.myDouble(); // Expected 10
        cashback(sender());
    }
}
