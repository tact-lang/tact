primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        if (a >= 5) {                 
            a.mutateFun();    // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.
        } else if (x > 5) {  
            a = 5;           
        } else {
            a = 7;
        }
        return 1 / (a - 5);   // No division by zero detected.
    }                         
}                                    
                                     