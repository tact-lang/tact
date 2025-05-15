primitive Int;
trait BaseTrait {}

struct MissMe {
    x: Int;
    y: Int;
}

contract Test {
    fun bar() {
        let a = MissMe;
    }
}
