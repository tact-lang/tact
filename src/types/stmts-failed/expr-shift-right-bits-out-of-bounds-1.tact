primitive Int;
trait BaseTrait { }

contract Test {
    get fun shift(x: Int): Int {
        return x >> (34605176784551 & 0xFFFFFFFFF);
    }
}
