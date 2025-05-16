const A: Int = 10;
const B: Int = A + 5;

contract TestRef {
    receive() {
         throwIf(104, B != 15);
    }
}
