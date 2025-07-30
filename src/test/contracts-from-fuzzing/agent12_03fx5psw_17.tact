const crc: Int = crc32("");

contract Test {
    receive() {
        let a = crc;
    }
}