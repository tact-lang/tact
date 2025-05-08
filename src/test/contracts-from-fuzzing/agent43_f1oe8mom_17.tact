contract TernaryOperatorTest() {
    receive() {
         // Ternary operator is right-associative.
         // According to documentation: false ? 1 : true ? 2 : 3 evaluates to 2
         let r = false ? 1 : true ? 2 : 3;
         require(r == 2, "Ternary error");
         dump(r);
         cashback(sender());
    }
}
