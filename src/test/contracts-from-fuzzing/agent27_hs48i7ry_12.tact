const A: Int = 21;
const B: Int = A + A;

contract Test {
    receive() {
        require(B == 42, "ok");
    }
}
