primitive Int;
trait BaseTrait {}

contract Test {

    // Currently, the analyzer does not track map mutations using the set or replace-like functions. 

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        xMap.set(1,1);                         // This will simply make the map undetermined.
        foreach (k, val in xMap) {               
            return 1 / (a - 5);                // The branch inside the loop produces a division by zero.
        }                                      
        return 0;                              
    }
}
