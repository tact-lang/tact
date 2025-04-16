contract B(param1: Int, param2: Int) {
    receive() {}
}

contract TestB {
    receive() {
         let s = initOf B(10, 20);
         s;
    }
}
