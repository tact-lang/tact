contract TestIfElseOK {
    receive() {
         let x: Int = 5;
         if (x > 3) {
             dump(1);
         } else {
             dump(0);
         }
    }
}
