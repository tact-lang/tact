primitive Int;

trait BaseTrait {}

trait T {
    const X: Int = 10;
}

contract C with T {
    override const X: Int = 20;
}
