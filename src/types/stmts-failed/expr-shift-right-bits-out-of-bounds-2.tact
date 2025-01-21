primitive Int;
trait BaseTrait { }

contract Test {
    get fun shift(x: Int): Int {
        return x >> (42 - 43);
    }
}
