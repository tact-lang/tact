primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (a > 5) {                 
            a = 10;     
        } else {
            a = 3;
        }
        return 1 / (a - 3);   // Division by zero, because condition in the if is false at compile time,                             
    }                         // which means that a = 3 after the conditional.
}                                    
                                     