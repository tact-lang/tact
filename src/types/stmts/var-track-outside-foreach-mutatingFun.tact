primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        foreach (k, val in xMap) {    // Currently, the analyzer cannot determine if a map is empty or not           
            a = 10 + k;               // because it does not track map mutations using the set function.  
            a = 5;                    // So, it will treat foreach loops as if their number of iterations is undetermined.
            a.mutateFun();            // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.
        }                             
        return 1 / (a - 5);           // If loop executes or not, not all paths assign a = 5. 
                                      // because "a" becomes undetermined inside the loop.
                                      // Hence, there is no division by zero detected.
    }
}
