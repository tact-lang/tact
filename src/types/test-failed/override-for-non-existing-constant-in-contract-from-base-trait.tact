primitive Int;

trait BaseTrait {
    const FOO: Int = 10;
}

contract Test {
    override const BAR: Int = 10;
}
