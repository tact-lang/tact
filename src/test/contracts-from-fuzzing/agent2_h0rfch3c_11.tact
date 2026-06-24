///////////////////////////////
// Test 9: Mixed named and wildcard parameter in function definition

fun f(a: Int, _: Int): Int {
    return a;
}

contract Test {
    receive() {
         dump(f(1, 2));
    }
}
