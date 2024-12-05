primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        do {                             
            return 1 / (a - 5);          // Since the loop executes at least once, and a = 5,
        } until (x > 0);                 // a division by zero will occur.                        
    }                                    
}                                       
