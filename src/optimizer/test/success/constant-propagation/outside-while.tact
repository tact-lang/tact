primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        while (v > 0) {    // v does not have a value at compile time                     
            a += 10;
            a = v - v + 6;                      
        }                                
        return 1 / (a - 5);         // Unknown if loop executes. No division by zero detected.
    }                              
}
