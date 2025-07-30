fun addOne(a: Int): Int { return a + 1; }
fun doubleValue(a: Int): Int { return a * 2; }

contract TestFunctionChain {
    receive() {
        // Chain function calls
        // Expected: addOne( doubleValue( addOne(10) ) ) = addOne( doubleValue(11) ) = addOne(22) = 23
        let result: Int = addOne(doubleValue(addOne(10)));
    }
}
