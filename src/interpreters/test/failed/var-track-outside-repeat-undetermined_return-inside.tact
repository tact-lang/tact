primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        repeat (v) {    // v does not have a value at compile time                     
            a += 10;
            a = 7;
            return 0;               // Loop branch cancelled       
        }                                
        return 1 / (a - 5);         // So, a = 5
                                    
    }                               
}
