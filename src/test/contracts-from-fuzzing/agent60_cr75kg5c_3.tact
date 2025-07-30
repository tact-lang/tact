contract TestAscii() {
    fun getAscii() : Int {
         // According to docs, ascii("⚡") should evaluate to 14850721
         return ascii("⚡");
    }
    
    receive() {
         self.getAscii();
    }
}
