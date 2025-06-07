contract Test {
    fun foo(_ : Int) : Int {
         return 42;
    }
    receive() {
         self.foo(1);
    }
}
