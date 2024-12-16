primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        foreach (k, val in xMap) {                      
            return 1 / (a - 5);          // Not reachable (loop does not execute)
        }                                
        return 0;                        
    }                                    
}                                        
