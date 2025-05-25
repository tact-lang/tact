primitive Int;
primitive Cell;
primitive Address;
trait BaseTrait {}

contract MapLiteralMismatch {
    get fun basic(): map<Int as uint8, Int as uint8> {
        return map<Int as uint8, Int as uint8> {};
    }

    get fun pure(): map<Int, Int> {
        return map<Int, Int> {};
    }

    get fun int257(): map<Int, Int> {
        return map<Int as int257, Int as int257> {};
    }

    get fun coins(): map<Int, Int as coins> {
        return map<Int, Int as varuint16> {};
    }
}
