primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        if (v >= 5) {                 
            x = 3;
        } else {
            a = 5;
        }
        return 1 / (a - 5);   // Division by zero, even though condition cannot be determined at compile time
    }                         // all paths before the return lead to a = 5.
}                                    
                                     