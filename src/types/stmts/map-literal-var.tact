primitive Int;
primitive Cell;
primitive Address;
trait BaseTrait {}

contract MapLiteralMismatch {
    get fun test(): Int {
        let basic: map<Int as uint8, Int as uint8> = map<Int as uint8, Int as uint8> {};
        let pure: map<Int, Int> = map<Int, Int> {};
        let int257: map<Int as int257, Int as int257> = map<Int, Int> {};
        let coins: map<Int, Int as varuint16> = map<Int, Int as coins> {};
        return 0;
    }
}
