// Test augmented assignment statement
contract TestAugAssignment {
    init() {
         let x: Int = 10;
         x += 5;
         dump(x); // expected output: 15
    }
}
