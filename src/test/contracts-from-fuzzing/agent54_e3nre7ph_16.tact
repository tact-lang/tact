contract TestNestedTry {
    receive() {
        try {
            // Inner try-catch
            try {
                throw(100);
            } catch (e) {
                dump(e);  // expected to dump 100
                throw(200); // re-throw a new exit code
            }
        } catch (outer) {
            dump(outer); // expected to catch and dump 200
        }
    }
}
