primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (v >= 5) {                 
            a = 5;     
        } else {
            a = 6;
        }
        return 1 / (a - 5);   // No division by zero detected: condition cannot be determined at compile time
    }                        // and not all branches inside the if assign a = 5.
}                                    
                                     