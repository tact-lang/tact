primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let x: Int = 10;
        repeat (x) {                     
            a += 10;                // Analyzer actually runs the loop 10 times. So a = 105 after the loop
        }                           // Analyzer will explicitly run repeats only if below or equal to the current limit at 2 ^ 12 = 4096 times.
        return 1 / (a - 105);         
    }
}
