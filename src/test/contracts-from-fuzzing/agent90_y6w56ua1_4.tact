contract TestReturnGetter {
    get fun testGetter(): Int {
         if (1 == 2) {
             return 10;
         } else {
             return 20;
         }
    }
}

contract TestReceiver {
    receive() {
         // Attempting to use return in a receiver
         // Note: receivers have no return type so we use bare return;
         return;
    }
}
