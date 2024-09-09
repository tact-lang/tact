primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        try {
            x += v;                  
            return 1 / v;           // Note tha analyzer cannot issue a division by zero here, because v is undetermined.
        } catch (e) {
            return 1 / (a - 5);     // If an error occurs during the try (for example, if v = 0),
        }                           // the catch would produce a division by zero.                        
    }                                    
}                                        
