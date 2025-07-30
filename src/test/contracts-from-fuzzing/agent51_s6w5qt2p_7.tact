fun testReturn(): Int {
    if (true) {
         return 10;
    }
    return 20;
}

contract Test {
    receive() {
         dump(testReturn());
    }
}
