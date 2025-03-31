contract TestReceiverReturn2 {
    receive () {
         if (true) { return; }
         dump(42);
    }
}
