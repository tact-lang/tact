contract TestRequireValid {
    receive() {
         // Using require with correct string message
         require(true, "OK");
         dump(1);
    }
}
