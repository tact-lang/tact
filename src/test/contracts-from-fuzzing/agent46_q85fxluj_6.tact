contract TestAddition {
    receive() {
         dump(3 + 4);
         dump(10 + 0);
         dump((-5) + 5);
    }
}
