contract EmptyStringTest {
    receive() {
         let s: String = "";
         if (s == "") {
             // Checks if empty string literal is handled correctly
         }
    }
}
