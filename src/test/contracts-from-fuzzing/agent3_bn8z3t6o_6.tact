const A: Int = 5;
const B: Int = A + 10;

contract Test {
    receive() {
        dump(B);
    }
}
