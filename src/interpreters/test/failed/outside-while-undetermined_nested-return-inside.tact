primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 10;
        let x: Int = 10;
        while (v > 0) {    // v does not have a value at compile time                     
            if (v > 0 && v < 10) {
                a = 10;
            } else if (x >= 10) {    // if program reaches "else if", condition is always true, because x does not get modified by loop
                a = 20;              // Hence, the "else if" branch always gets cancelled
                return 0;           
            } else {
                a = 5;               // This assignment gets ignored because the program never reaches it
            }
        }                                
        return 1 / (a - 10);         // Hence, the loop fix-point contains a = 10. Division by zero
    }                               
}
