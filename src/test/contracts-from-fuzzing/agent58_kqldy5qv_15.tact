contract TestGetterComplex {
    // A getter function with nested blocks and conditionals
    get fun getVal(): Int {
         if (true) {
              { return 10; }
         } else {
              return 20;
         }
    }
}

contract TestReceiverComplex {
    // A receiver function that uses nested blocks and conditionals with explicit return
    receive() {
         if (myAddress() == myAddress()) {
              { return; }
         } else {
              // This branch is unreachable (but the syntax requires a body)
              return;
         }
    }
}
