contract DebugTestVoidDump {
    receive() {
        // dump(42) should print 42; however it returns void.
        // Now, attempt to dump the result of dump(42). It is expected to fail because void cannot be dumped.
        dump(dump(42));
    }
}
