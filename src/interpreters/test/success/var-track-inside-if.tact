primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (a > 5) {                 
            return 1 / (a - 5);      // Not reachable
        }                            
        return 0;                    
    }                                
}                                    