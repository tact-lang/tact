trait BaseTrait {}
trait T {
    fun foo() {}
}

contract Test with T {
    override fun foo() {}
}
