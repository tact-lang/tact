primitive Int;

trait BaseTrait {}

struct Bar {
    val: Int;
}

contract Test {
    get fun foo(): Int {
        return Bar.opcode();
    }
}
