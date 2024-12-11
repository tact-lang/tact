primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (v >= 5) {                 
            a.mutateFun();    // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.    
        }
        return 1 / (a - 5);   // No division by zero detected: condition cannot be determined at compile time
    }                        // and not all branches assign a = 5.
}                                    
                                     