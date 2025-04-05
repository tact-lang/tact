fun increment(x: Int): Int { return x + 1; }
fun double(x: Int): Int { return x * 2; }

contract TestFunctionChain {
    receive() {
         let v: Int = double(increment(5));
         // v should be (5+1)*2 = 12
    }
}
