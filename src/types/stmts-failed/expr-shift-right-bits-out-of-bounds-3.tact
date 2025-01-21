primitive Int;
trait BaseTrait { }

const SHIFT_VAL: Int = 1000;

contract Test {
    get fun shift(x: Int): Int {
        return x >> SHIFT_VAL;
    }
}
