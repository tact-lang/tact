/// Test 1: Global constant dependency chain
const A: Int = 5;
const B: Int = A + 6;

contract Test1 {
    get fun getB() : Int {
         return B; // Expected: 11
    }
}
