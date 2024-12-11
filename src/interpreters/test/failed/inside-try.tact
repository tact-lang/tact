primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 0;
        try {
            x += v;                  
            return 1 / (a - 5);          // If try reaches the end, it would produce a division by zero
        }                                
        return 0;                        
    }                                    
}                                        
