contract OptionalTest {
    fun test(): Int {
         // Declare an optional variable, implicitly null
         let x: Int? = null;
         // Reassign it a value
         x = 123;
         // Use the non-null assertion operator to return the value
         return x!!;
    }

    receive() {
         dump(self.test());
         cashback(sender());
    }
}
