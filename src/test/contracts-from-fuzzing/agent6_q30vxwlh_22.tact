contract TestThrowIfValid {
    receive() {
        // Should not throw because condition is false
        throwIf(101, false);
        dump(1);
    }
}
