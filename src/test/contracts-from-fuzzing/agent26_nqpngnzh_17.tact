contract TestTryNoCatch {
    receive() {
         try {
             throw(42);
         }
         dump(1);
    }
}
