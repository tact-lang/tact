fun testTry(): Int {
    if (true) {
       try {
           throw(100);
       } catch (_) {
           return 42;
       }
    }
    return 1;
}

contract Test {
    receive() {
         dump(testTry());
    }
}
