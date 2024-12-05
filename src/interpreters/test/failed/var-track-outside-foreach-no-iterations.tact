primitive Int;
trait BaseTrait {}

contract Test {

    // Currently, the analyzer does not track map mutations using the set or replace-like functions. 

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        foreach (k, val in xMap) {          // Map empty, loop does not execute
            a = 10 + k;               
            a = 6;                    
        }                             
        return 1 / (a - 5);           // Hence: a = 5, there is a division by zero.
    }
}
