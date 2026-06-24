contract TestThrowIf {
    receive() {
        try {
            throwIf(1024, true);
            dump(0); // should not execute
        } catch (e) {
            dump(e); // expecting 1024
        }
        dump(200); // following try/catch, should execute
    }
}
