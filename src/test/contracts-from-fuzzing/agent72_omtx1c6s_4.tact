contract TestTryNoCatch {
    receive() {
         try {
              throw(101);
         }
         dump(101);
    }
}
