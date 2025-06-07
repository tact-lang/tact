contract TestFunctionCall2 {
    fun double(x: Int): Int {
         return x * 2;
    }
    receive() {
         let a: Int = self.double(10);
         dump(a);
    }
}
