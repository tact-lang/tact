fun test_hashData(): Int {
    // 'TestString' is 10 bytes, so hashData should work without error
    return "TestString".hashData();
}

contract TestContract {
    receive() {
        test_hashData();
    }
}
