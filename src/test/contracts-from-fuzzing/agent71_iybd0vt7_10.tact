fun addOne(x: Int): Int { return x + 1; }
fun doubleVal(x: Int): Int { return x * 2; }

contract TestFunctionChain {
    receive() {
         let result: Int = addOne(doubleVal(3));
         dump(result);
    }
}
