contract TestIfElse {
    receive() {
         if (2 + 2 == 4) {
             dump(10);
         } else {
             dump(20);
         }
    }
}
