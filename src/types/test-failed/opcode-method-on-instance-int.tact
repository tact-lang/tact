primitive Int;

trait BaseTrait {}

contract Test {
    get fun foo(): Int {
        return 10.opcode();
    }
}
