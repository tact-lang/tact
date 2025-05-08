contract TestLogicalNot {
    receive() {
         dump(!true);
         dump(!false);
         dump(!(!true));
    }
}
