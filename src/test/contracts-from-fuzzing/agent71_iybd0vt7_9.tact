contract TestOptionals {
    receive() {
         let a: Int? = 100;
         dump(a!!);
         let b: Int? = null;
         if (b != null) {
             dump(b!!);
         } else {
             dump(0);
         }
    }
}
