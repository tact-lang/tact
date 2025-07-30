contract TestCRC() {
   // This constant uses a compile-time function: crc32("Tact")
   // and then adds 42 and applies bitmask to ensure a 32-bit result.
   // Expected value as per documentation is 898001897.
   const TEST_CRC: Int = (crc32("Tact") + 42) & 0xFFFF_FFFF;

   get fun getTestCrc() : Int {
       return self.TEST_CRC;
   }
}
