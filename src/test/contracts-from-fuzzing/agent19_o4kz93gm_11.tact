contract TestAssignment {
    receive() {
         let x: Int = 1;
         x = 2;
         x += 3;
         dump(x);
    }
}
