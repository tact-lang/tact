contract TestContract {
    receive() {
         let y: Int = 1;
         repeat (3) {
             y = y * 2;
         }
         dump(y);
    }
}
