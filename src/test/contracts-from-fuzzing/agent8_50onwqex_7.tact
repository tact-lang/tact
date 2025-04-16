contract Test {
    receive() {
         // Testing try-catch statement
         try {
             throw(123);
         } catch (err) {
             dump(err);
         }
    }
}
