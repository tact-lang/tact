const crcConst: Int = crc32("000DEADBEEF000");
const shaConst: Int = sha256("hey, I'll produce the SHA256 number at compile-time");

contract TestCompileCT() {
    get fun getCrc(): Int {
        return crcConst;
    }
    
    get fun getSha(): Int {
        return shaConst;
    }
    
    // Dummy receiver to enforce full compilation
    receive() {}
}
