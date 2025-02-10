primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        xMap.set(1,1);                
        foreach (k, val in xMap) {             
            a = 10 + k;               
            a = 6;                    
        }                             
        return 1 / (a - 5);           // No division by zero detected.
    }
}
