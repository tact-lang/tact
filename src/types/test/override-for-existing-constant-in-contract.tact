primitive Int;

trait BaseTrait {}
trait T {
    const BAR: Int = 10;
}

contract Test with T {
    override const BAR: Int = 100;
}
