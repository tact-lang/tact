const FOO: Int = crc32("crc32") + 42;

contract Test {
    get(FOO) fun test(): Int {
        return FOO;
    }
}
