primitive Int;
trait BaseTrait {}

contract Test {

    // Currently, the analyzer does not track map mutations using the set or replace-like functions. 

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        xMap.set(1,1);                // Map is undetermined
        foreach (k, val in xMap) {             
            a = 10 + k;               
            a = 6;                    
        }                             
        return 1 / (a - 5);           // If loop executes or not, not all paths assign a = 5. 
                                      // Hence, there is no division by zero detected.
    }
}
