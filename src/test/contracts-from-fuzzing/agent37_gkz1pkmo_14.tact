fun addOne(x: Int): Int { return x + 1; }

fun twice(x: Int): Int { return x * 2; }

contract TestFunctionCalls {
    receive() {
         let a: Int = twice(addOne(10));         // expected: twice(11)=22
         let b: Int = addOne(twice(10));          // expected: addOne(20)=21
         let c: Int = twice(addOne(twice(addOne(2)))); // addOne(2)=3, twice(3)=6, addOne(6)=7, twice(7)=14
    }
}
