contract TestThrowIfNoThrow {
    receive() {
        throwIf(100, false); // condition false, should not throw
        dump(1);
    }
}
