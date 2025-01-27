primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        do {    
            a += 10;                    
        } until (v > 0);   // v does not have a value at compile time. Analyzer stops.
        return 1 / (a - 5);         
    }
}
