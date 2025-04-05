fun add(a: Int, b: Int): Int { return a + b; }

contract TestFunctionCallChain {
    receive() {
         // Simple function call
         let result1 = add(2, 3); // Expected result: 5
         dump(result1);
         
         // Nested function call inline
         let result2 = add(add(4, 1), 10); // add(4,1)=5, then 5+10=15
         dump(result2);
    }
}
