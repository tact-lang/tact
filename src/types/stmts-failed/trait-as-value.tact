primitive Int;
trait BaseTrait {}

trait MissMe {
    fun foo() {}
}

contract Test {
    fun bar() {
        let a = MissMe;
    }
}
