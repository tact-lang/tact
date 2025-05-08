contract TestStringLiteral {
    receive() {
         let s1: String = "Hello, World!";
         let s2: String = "this \"literally\" works";
         let s3: String = "line \n break";
         s1.asComment();
         s2.asComment();
         s3.asComment();
    }
}
