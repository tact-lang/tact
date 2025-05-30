contract TestCrc32() {
    fun getCrc32() : Int {
         // According to docs, crc32("000DEADBEEF000") should evaluate to 1821923098
         return crc32("000DEADBEEF000");
    }
    
    receive() {
         self.getCrc32();
    }
}
