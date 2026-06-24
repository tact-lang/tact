contract TestStringLiteral {
    receive() {
         // Test string literal assignment and dumping
         let a: String = "Hello, TON!";
         dump(a);
    }
}
