contract ParenthesisPrecedenceTest {
    receive() {
         let x: Int = (10 + 20) * (3 - 5) / 2;
         dump(x);
    }
}
