contract DebugTestEmitDump {
    // Testing dump() with an emit() function call, which doesn't return a value
    receive() {
        dump(emit("Test".asComment()));
    }
}
