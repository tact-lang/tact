trait BaseTrait {}
trait T {
    fun foo() {}
}

trait Test with T {
    override fun foo() {}
}
