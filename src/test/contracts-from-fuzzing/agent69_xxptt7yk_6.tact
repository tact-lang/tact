contract BinaryArithmeticTest {
    receive() {
         let a: Int = 1 + 2; 
         dump(a);
         let b: Int = 5 * 4; 
         dump(b);
         let c: Int = 10 / 2; 
         dump(c);
    }
}
