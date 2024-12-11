primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        repeat (x) {                     
            a = 10;                      
        }                                
        return 1 / (a - 5);         // Loop does not execute. Hence, after the loop, a = 5,
    }                               // which means division by zero.
}
