contract TestOptionalReturn {
    fun testOptional(flag: Bool): Int? {
         if (flag) {
             return 123;
         } else {
             return null;
         }
    }
}
