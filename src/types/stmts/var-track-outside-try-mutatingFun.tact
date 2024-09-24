primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        try {
            x += v;                  
            a.mutateFun();    // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.                     
        }                                
        return 1 / (a - 5);    // Independently if the try successfully executes or not, not all paths lead to a = 5.
    }                          // Hence, no division by zero detected.
}