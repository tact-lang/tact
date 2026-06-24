const GLOBAL_ARITH: Int = 1 + 2 * 3;

contract Test {
    receive() {
         let x: Int = GLOBAL_ARITH;
    }
}
