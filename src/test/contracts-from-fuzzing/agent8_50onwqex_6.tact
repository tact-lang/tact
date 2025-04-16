contract Test {
    receive() {
         // Valid if...else statement
         if (true) {
             dump(1);
         } else {
             dump(0);
         }
    }
}
