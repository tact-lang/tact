primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 7;
        let x: Int = 0;
        try {
            x += v;                  
            a = x - x + 5;     // a = 5
            return 0;          // The presence of the return ensures that after the try, variable "a" CANNOT be 5
        }                                
        return 1 / (a - 7);    // If the program reaches this line, it means that it must have failed the try, otherwise 
    }                          // the return inside the try would have executed. Note that the catch is empty, which means that variable
}                              // "a" remains unchanged (meaning a = 7). Hence, division by zero.
