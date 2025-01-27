primitive Int;
trait BaseTrait {}

extends mutates fun mutateFun(self: Int) {
    self = 5;
}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        while (x > 0) {                      
            a += 10;
            a.mutateFun();    // The analyzer treats mutating functions as black boxes. "a" becomes undetermined at this point.                                         
            x -= 1;
        }                                
        return 1 / (a - 5);         // No division by zero
    }                               
}
