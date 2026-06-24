fun testTryCatch(flag: Bool): Int {
    try {
         if (flag) { throw(123); }
         return 5;
    } catch (err) {
         return err;
    }
}

contract Test {
    receive() {
         dump(testTryCatch(true));  // Expected: 123
         dump(testTryCatch(false)); // Expected: 5
    }
}
