primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        if (v >= 5) {                 
            a = 6;
        } else if (x > 5) {  // Since the condition is true, a = 7 after the nested conditional.
            a = 7;           // However, v >= 5 cannot be evaluated, so, two branches lead to a = 6 and a = 7.
        } else {
            a = 5;
        }
        return 1 / (a - 7);   // No division by zero detected.
    }                         
}                                    
                                     