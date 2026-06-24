const A: Int = 100;
const B: Int = A + 23;

contract Test {
    receive() {
         let x: Int = B;
    }
}
