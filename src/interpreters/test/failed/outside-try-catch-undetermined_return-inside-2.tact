primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 7;
        let x: Int = 0;
        try {
            x += v;                  
            a = x - x + 5;     // a = 5
        } catch (e) {          
            a = 8;
            return 0;          // Independently if the try successfully executes or not, the presence of the return ensures that after the try/catch
        }                      // variable "a" CANNOT be 8     
        return 1 / (a - 5);    // If the program reaches this line, it means that it must have executed the try successfully, 
    }                          // otherwise the return would have executed inside the catch. Hence, division by zero.
}
