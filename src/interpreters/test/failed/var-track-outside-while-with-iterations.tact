primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        while (x >= 10) {                     
            a += 10;
            a = v - v + 3;
            x -= 1;                      
        }                                
        return 1 / (a - 3);         // Loop executes. After each iteration, a = 3,
    }                               // which means division by zero after the loop.
}
