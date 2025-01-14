trait BaseTrait {}
trait T {}

trait T2 {
    fun foo() {}
}

contract Test with T, T2 {
    override fun foo() {}
}
