contract TestThrowAndCatchFixed {
    receive() {
         try {
             throw(1042);
         } catch (err) {
             dump(err);
         }
         dump(42);
    }
}
