contract C(param: Int) {}

contract TestC {
    receive() {
         let s = initOf C(10);
    }
}
