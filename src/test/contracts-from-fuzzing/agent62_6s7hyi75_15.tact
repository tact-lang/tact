fun addOne(i: Int): Int { return i + 1; }

contract TestChainedCall {
    receive() {
         // Testing chained function calls
         let a: Int = addOne(addOne(42)); // Expected result is 44
         dump(a);
    }
}
