trait BaseTrait {}

trait T1 { fun foo() {} }

trait T2 with T1 {}

trait T3 with T2 {}

contract Test with T3 {
    override fun foo() {}
}
