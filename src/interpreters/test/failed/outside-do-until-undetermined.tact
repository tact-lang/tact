primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        do {    
            a += 10;
            a = v - v + 5;                      
        } until (v > 0);   // v does not have a value at compile time                     
        return 1 / (a - 5);         // Unknown if loop executes. But if it does or not, all paths lead to a = 5,
    }                               // which means division by zero after the loop.
}
