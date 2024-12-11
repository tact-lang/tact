primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 7;
        let x: Int = 10;
        if (v > 0 && v < 10) {
            a = 10;
        } else if (x >= 10) {    // if program reaches "else if", condition is always true, because x does not get modified
            a = 20;              // Hence, the "else if" branch always gets cancelled
            return 0;
        } else {
            a = 5;               // This assignment gets ignored because the program never reaches it
        }
        return 1 / (a - 10);   // Division by zero, 
    }                         
}                                    
                                     