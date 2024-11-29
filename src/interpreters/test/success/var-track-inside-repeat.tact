primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        repeat (x) {                     
            return 1 / (a - 5);          // Not reachable (loop does not execute)
        }                                
        return 0;                        
    }                                    
}                                        
