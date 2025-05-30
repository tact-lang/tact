contract TestSender {
    receive() {
         dump(sender());
    }
}
