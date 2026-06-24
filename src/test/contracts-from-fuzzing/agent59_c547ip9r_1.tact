contract TestAscii() {
    fun test() {
        dump(ASCIIVAL);
    }
}

// Compile-time evaluation of ascii("⚡")
// Expected value: 14850721 (0xE29AA1 in hexadecimal)
const ASCIIVAL: Int = ascii("⚡");