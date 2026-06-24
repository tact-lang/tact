contract B(param: Int) {
    receive() {}
}

contract Test1 {
    receive() {}
    get fun testInitCode(): Cell {
         return initOf B(42).code;
    }
}
