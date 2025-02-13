primitive Int;
trait BaseTrait {}

contract Test {

    // The loop will execute at least once. So, the lines after the loop will never be reached
    // because of the return inside the loop.

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 1048576;    // A big number so that the analyzer does not attempt to actually run the entire loop.
        repeat (x) {                     
            a += 10;
            a = v - v + 3;
            return 0;                      
        }                                
        1 / (a - 5);
        return 1 / (a - 3);
    }
}
