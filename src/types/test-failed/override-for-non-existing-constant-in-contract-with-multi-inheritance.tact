primitive Int;

trait BaseTrait {}
trait T {
    const BAR: Int = 10;
}

trait T2 {
    const BAZ: Int = 10;
}

contract Test with T, T2 {
    override const FOO: Int = 10;
}
