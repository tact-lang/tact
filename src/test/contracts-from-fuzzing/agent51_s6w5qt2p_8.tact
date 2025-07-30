fun testTryNoCatch(): Int {
    try {
        return 1;
    }
    // No catch block provided
    return 2;
}

contract Test {
    receive() {
         dump(testTryNoCatch());
    }
}
