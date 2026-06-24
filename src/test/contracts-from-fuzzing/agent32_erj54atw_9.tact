contract TestStringCast {
    receive() {
         // This uses the extension function asComment() defined on String literals as per the docs
         let c = "Tact is awesome!".asComment();
         dump(c);
    }
}
