const crc: Int = crc32("Hello");

contract Test {
    receive() {
        let a = crc;
    }
}