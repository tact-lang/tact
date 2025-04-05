contract TestOptional {
    fun testOptionals() {
         // Initially optional is null
         let x: Int? = null;
         if (x == null) {
             dump(0); // expected output 0
         } else {
             dump(x!!); // should not be executed
         }
         // Assign a non-null value
         x = 42;
         dump(x!!); // expected output 42
    }
    receive() { self.testOptionals(); }
}
