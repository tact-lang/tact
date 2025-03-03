primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        do {                     
            a += 1;
            x -= 1;
            a = x - x + 10;                      
        } until (x > 0);                                
        return 1 / (a - 10);        // Loop executes more than once. Hence, but after each loop iteration, a = 10,
    }                               // which means division by zero.
}
