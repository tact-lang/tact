contract TestWhile {
    receive() {
         let x: Int = 3;
         while (x > 0) {
             dump(x);
             x = x - 1;
         }
    }
}
