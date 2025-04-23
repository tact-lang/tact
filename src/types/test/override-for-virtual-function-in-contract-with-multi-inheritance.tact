trait BaseTrait {}
trait T {}

trait T2 {
    virtual fun foo() {}
}

contract Test with T, T2 {
    override fun foo() {}
}
