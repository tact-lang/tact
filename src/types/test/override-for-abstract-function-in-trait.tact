trait BaseTrait {}

trait T {
    abstract fun foo();
}

trait Test with T {
    override fun foo() {}
}
