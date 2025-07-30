const X: Int = Y + 1;
const Y: Int = 100;

contract Test {
    get fun ret(): Int {
         // If evaluated correctly, X should be 101
         return X;
    }

    receive() {}
}
