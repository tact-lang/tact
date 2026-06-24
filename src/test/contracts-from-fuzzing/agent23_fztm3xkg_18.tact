contract TestShadowing2 {
    receive() {
         let x: Int = 10;
         {
             // Attempt to shadow variable x in an inner block
             let y: Int = x + 10;
             dump(y);
         }
         dump(x);
         return;
    }
}
