primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        foreach (k, val in xMap) {    // Currently, the analyzer cannot determine if a map is empty or not           
            a = 10 + k;               // because it does not track map mutations using the set function.  
            a = 6;                    // So, it will treat foreach loops as if their number of iterations is undetermined.
        }                             
        return 1 / (a - 5);           // If loop executes or not, not all paths assign a = 5. 
                                      // Hence, there is no division by zero detected.
    }
}
