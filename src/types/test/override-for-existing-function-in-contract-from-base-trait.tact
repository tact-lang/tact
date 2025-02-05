trait BaseTrait {
    fun foo() {}
}

trait Test with BaseTrait {
    override fun foo() {}
}
