contract TestLiteralChaining {
    receive() {
         // Testing extension function on literal string
         dump("Tact is awesome!".asComment());
         
         // Testing extension function on integer literal, converting it to a string
         dump(42.toString());
    }
}
