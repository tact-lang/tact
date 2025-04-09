contract DebugTestVoidDump {
    // Test dump() with an expression that returns void, such as emit()
    receive() {
        dump(emit("msg".asComment()));
    }
}
