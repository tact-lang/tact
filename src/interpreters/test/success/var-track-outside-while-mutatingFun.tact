primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        while (v > 0) {    // v does not have a value at compile time                     
            a += 10;
            a.mutateFun();    // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.                                         
        }                                
        return 1 / (a - 5);         // Unknown if loop executes. But if it does or not, not all paths lead to a = 5,
    }                               // which means no division by zero detected.
}
