contract C(param: Int) {}

contract TestC {
    receive() {
         let s = initOf C(100);
         let c = codeOf C;
    }
}
