contract TestThrowUnless {
    receive() {
        try {
            throwUnless(1024, false);
            dump(0); // should not execute
        } catch (e) {
            dump(e); // expecting 1024
        }
    }
}
