contract Test {
    receive() {
         // Testing augmented assignment '+=' statement
         let x: Int = 10;
         x += 5;
         dump(x);
    }
}
