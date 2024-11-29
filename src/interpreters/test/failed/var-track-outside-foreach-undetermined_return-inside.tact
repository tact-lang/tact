primitive Int;
trait BaseTrait {}

contract Test {

    // Currently, the analyzer does not track map mutations using the set or replace-like functions. 

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        xMap.set(1,1);                // Makes map undetermined
        foreach (k, val in xMap) {    
            a = 10 + k;               
            a = 6;                    
            return 0;                 // Loop branch cancelled 
        }                             
        return 1 / (a - 5);           // So, if program reaches here: a = 5, which means division by zero.
    }
}
