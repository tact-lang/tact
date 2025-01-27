primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        if (a > 5) {                 
            a = 6;
        } else {
            x = 7;
        }
        return 1 / (a - 6);   // No division by zero detected
    }                        
}                                    
                                     