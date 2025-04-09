trait BaseTrait {}
trait T {
    virtual fun foo() {}
}

trait Test with T {
    override fun foo() {}
}
