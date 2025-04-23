trait BaseTrait {}
trait T {
    virtual fun foo() {}
}

contract Test with T {
    override fun foo() {}
}
