primitive Int;
trait BaseTrait { }

contract Test {
    const foo: Int = 42;

    fun bar() {
        self.foo = 43 // <-- trying to assign to a constant
    }
}