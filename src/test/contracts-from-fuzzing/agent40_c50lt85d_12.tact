contract TestIntToString {
    receive() {
         let s: String = (42).toString();
         if (s == "42") {
             // Conversion of Int to String works as expected
         }
    }
}
