primitive Int;

trait BaseTrait {
    const BAR: Int = 100;
}

contract Test with BaseTrait {
    override const BAR: Int = 100;
}
