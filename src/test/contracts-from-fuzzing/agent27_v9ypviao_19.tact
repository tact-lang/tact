contract TestAugmentedAssignmentsValid {
    receive() {
         let x: Int = 10;
         x += 5;    // x becomes 15
         x -= 3;    // x becomes 12
         x *= 2;    // x becomes 24
         x /= 2;    // x becomes 12
         dump(x);
    }
}
