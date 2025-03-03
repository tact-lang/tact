primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (a >= 5) {                 
            a = 10;     
        }
        return 1 / (a - 10);   // Division by zero, because condition in the if is true at compile time,                             
    }                          // which means that a = 10 after the conditional.
}                                    
                                     