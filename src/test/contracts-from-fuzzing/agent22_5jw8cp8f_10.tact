fun testTryCatchOk(): Int {
    try {
        if (false) { throw(1042); }
        return 100;
    } catch (error) {
        return error;
    }
}

contract TestTryCatchOk {
    receive() {
         dump(testTryCatchOk());
    }
}
