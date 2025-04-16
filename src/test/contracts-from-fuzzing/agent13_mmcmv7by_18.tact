fun doNothing() {}

contract DebugTestVoidDump {
    // Testing dump() with a void value, obtained from a function that doesn't return.
    receive() {
        dump(doNothing());
    }
}
