primitive Int;
trait BaseTrait {}

contract Test {

    // Currently, the analyzer does not track map mutations using the set or replace-like functions. 

    // Because of the returns inside the loop, all those branches get cancelled.
    // The only surviving one is the else.
    // Therefore, the loop fix-point will have a = 5 (because the initial value is a = 5 
    // and it does not change inside the "else").
    // Which means a division by zero at line A.

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let xMap: map<Int,Int> = emptyMap();
        xMap.set(1,1);                         // This makes the map undetermined.
        foreach (k, val in xMap) {         
            if (v > 0 && v < 10) {
                a = 10;
                return 0;
            } else if (v > 10 && v < 20) {
                a = 20;
                return 0;
            } else {
            }          
        }                             
        return 1 / (a - 5);           // Line A
    }
}
