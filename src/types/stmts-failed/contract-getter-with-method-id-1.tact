primitive Int;
trait BaseTrait { }

contract Test {
    get(crc32("crc32") + "42") fun test(): Int {
        return 0
    }
}
