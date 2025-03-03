primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        repeat (x) {                      
            a += 10;
            a = v - v + 6;              // a becomes undetermined.        
        }                                
        return 1 / (a - 5);         // No division by zero detected.
    }                               
}
