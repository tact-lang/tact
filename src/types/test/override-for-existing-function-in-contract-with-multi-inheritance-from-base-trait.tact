trait BaseTrait {
    fun foo() {}
}
trait T {
    fun bar() {}
}

trait T2 {
    fun baz() {}
}

contract Test with T, T2 {
    override fun foo() {}
}
