extends fun double(self: Int): Int {
    return self + self;
}

contract TestExt() {
    receive() {
         let result = 10.double();
         require(result == 20, "OK");
         cashback(sender());
    }
}
