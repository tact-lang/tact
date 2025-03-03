primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        do {                     
            a += 1;                      
        } until (x >= 0);                                
        return 1 / (a - 6);        // Loop does not execute more than once. Hence, after the loop, a = 6,
    }                              // which means division by zero.
}
