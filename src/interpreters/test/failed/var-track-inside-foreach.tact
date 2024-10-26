primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        foreach (k, val in xMap) {             // Currently, the analyzer cannot determine if a map is empty or not           
            return 1 / (a - 5);                // because it does not track map mutations using the set function.  
        }                                      // So, it will treat foreach loops as if their number of iterations is undetermined.
        return 0;                              // In case the loop executes, it will produce a division by zero.
    }
}
