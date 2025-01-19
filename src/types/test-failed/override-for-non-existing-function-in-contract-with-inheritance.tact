trait BaseTrait {}
trait T {}

contract Test with T {
    override fun foo() {}
}
