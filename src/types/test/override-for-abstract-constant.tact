primitive Int;

trait BaseTrait {}

trait T {
    abstract const X: Int;
}

contract C with T {
    override const X: Int = 20;
}
