contract OptionalTest {
    fun test() {
         let opt: Int? = null;
         opt = 42;
         require(opt!! == 42, "Optional non-null failed");
    }
    
    receive() {
         self.test();
    }
}
