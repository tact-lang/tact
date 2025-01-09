primitive Int;
trait BaseTrait { }

contract Test {
    get((crc32("crc32") + 42) & 0x3FFFF | 0x4000) fun test(): Int {
        return 0
    }
}
