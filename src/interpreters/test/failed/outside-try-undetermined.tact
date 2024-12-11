primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        try {
            x += v;                  
            a = x - x + 5;
        }                                
        return 1 / (a - 5);    // Independently if the try successfully executes or not, all paths lead to a = 5.
    }                          // Hence, division by zero. Note that the catch is empty, which means that variable
}                              // "a" remains unchanged (meaning a = 5 also).
