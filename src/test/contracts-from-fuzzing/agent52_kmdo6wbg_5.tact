contract BinaryArithmeticTest {
    receive() {
         let result: Int = 10 + 20 * 3 - 5 / 2;
         dump(result);
    }
}
