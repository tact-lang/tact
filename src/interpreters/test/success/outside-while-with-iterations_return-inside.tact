primitive Int;
trait BaseTrait {}

contract Test {

    // The loop will execute at least once. So that lines A and B below will never be reached
    // because of the return inside the loop.

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        while (x >= 10) {                     
            a += 10;
            a = v - v + 3;
            x -= 1;                      
            return 0;
        }                                
        1 / (a - 3);                // Line A
        return 1 / (a - 5);         // Line B
    }                               
}
