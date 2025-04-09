contract TestStringEquality {
    receive() {
         let s1: String = "Hello";
         let s2: String = "Hello";
         if (s1 == s2) {
              let dummy: Int = 1;
         }
    }
}
