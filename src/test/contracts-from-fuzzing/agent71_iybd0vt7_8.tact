contract TestCasting {
    receive() {
         // Testing extension function on literal (casting to String via toString())
         dump(42.toString());
    }
}
