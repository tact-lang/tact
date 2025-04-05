contract OpTest {
    receive() {
         let x = 5 + 3 * 2; // expected to be 11 based on standard operator precedence
         dump(x);
         cashback(sender());
    }
}
