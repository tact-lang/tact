const C: Int = D + 1;
const D: Int = 10;

contract Test {
    get fun getC() : Int {
         return C; // Expected 11 if forward references are allowed
    }
}
