primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        if (v >= 5) {                 
            a.mutateFun();    // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.
        } else if (x > 5) {  // Since x > 5 is true, a = 5 after the nested conditional.
            a = 5;           // However, v >= 5 cannot be evaluated, so, two branches lead to "a = undetermined" and a = 5.
        } else {
            a = 7;
        }
        return 1 / (a - 5);   // No division by zero detected.
    }                         
}                                    
                                     