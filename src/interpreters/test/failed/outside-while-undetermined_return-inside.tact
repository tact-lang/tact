primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        while (v > 0) {    // v does not have a value at compile time                     
            a += 10;
            a = v - v + 20;
            return 0;                      
        }                                
        return 1 / (a - 5);         // Unknown if loop executes. But if it does or not, the branch inside the loop gets cancelled
                                    // because of the return. Hence, the fix-point will remain at the starting environment, with a = 5,
    }                               // which means division by zero after the loop.
}
