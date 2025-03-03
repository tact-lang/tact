primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let b: Int = 6;
        let c: Int = a - b + v;  // -1 + v
        b += a + 1;              // 12
        1 / (b - 12);             // Division by zero
        return 0;
    }
}