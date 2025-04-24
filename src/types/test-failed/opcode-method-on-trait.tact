primitive Int;

trait BaseTrait {}
trait Ownable {}

contract Test {
    get fun foo(): Int {
        return Ownable.opcode();
    }
}
