contract TestInline {
    inline fun double(x: Int): Int {
         return x * 2;
    }
    
    fun testInline(): Int {
         return self.double(21);
    }
    
    receive() {}
}
