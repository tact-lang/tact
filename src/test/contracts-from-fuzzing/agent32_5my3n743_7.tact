/*
Test: Test the 'crc32' compile-time function with an empty string.
Expected: Compilation completes successfully and computes a checksum (likely 0 or other CRC32 value for empty string).
*/

contract TestCrc32Empty {
    checksum: Int = crc32("");
    
    receive() {}
}
