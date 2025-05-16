/* Test for crc32 with empty string input. Expected to compute CRC32 of empty string.
   Commonly, the CRC32 of empty string is 0.*/
contract TestCrc32Empty {
    // The common CRC32 of "" (empty string) is 0
    val: Int = crc32("");
    
    receive() {}
}
