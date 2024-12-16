primitive Int;
trait BaseTrait {}

contract Test {

    get fun foo(v: Int): Int {
        let a: Int = 5;
        let b: Int = 6;
        let c: Int = a - b + v;  // -1 + v
        a = c - c;               // 0, note that c cannot be evaluated to a value, because v is undetermined, but algebraically, a = 0. 
        b += a + 3;              // 9
        1 / (b - 9);             // Division by zero
        return 0;
    }
}