contract Test {
    receive() {
         let i: Int = 3;
         while (i > 0) {
             i = i - 1;
         }
         dump(i);
    }
}
