primitive Int;
primitive Cell;
primitive Address;
trait BaseTrait {}

contract MapLiteralMismatch {
    get fun test1(): map<Int as int32, Int as int32> {
        return map<Address, Cell> {};
    }
}
