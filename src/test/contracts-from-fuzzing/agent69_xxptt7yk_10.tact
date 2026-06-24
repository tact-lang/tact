contract TernaryTest {
    receive() {
         // Testing ternary operator associativity
         let a: Int = false ? 1 : (false ? 2 : 3);
         dump(a); // Expected output: 3
    }
}
