primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    // Currently, the analyzer does not track map mutations using the set or replace-like functions. 

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        xMap.set(1,1);                // Map becomes undetermined
        foreach (k, val in xMap) {          
            a = 10 + k;               
            a = 5;                    
            a.mutateFun();            // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.
        }                             
        return 1 / (a - 5);           // If loop executes or not, not all paths assign a = 5. 
                                      // because "a" becomes undetermined inside the loop.
                                      // Hence, there is no division by zero detected.
    }
}
