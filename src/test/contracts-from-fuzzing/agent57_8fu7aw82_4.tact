const A: Int = 10;
const B: Int = A + 5;

contract Test {
    receive() {
        dump(B);
    }
}
