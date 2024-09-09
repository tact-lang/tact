primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        if (v >= 5) {                 
            a = 5;     
        }
        return 1 / (a - 5);   // Division by zero, even though condition cannot be determined at compile time
    }                        // the branch inside the if also assigns a = 5.
}                                    
                                     