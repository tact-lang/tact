const A: Int = B + 1;
const B: Int = 2;

contract TestCircular {
    receive() {
        let x: Int = A;
    }
}
