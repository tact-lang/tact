primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        if (v >= 5) {                 
            x = 3;
        } else {
            a = 6;
        }
        return 1 / (a - 5);   // No division by zero detected: condition cannot be determined at compile time
    }                         // and not all paths lead to a = 5.
}                                    
                                     