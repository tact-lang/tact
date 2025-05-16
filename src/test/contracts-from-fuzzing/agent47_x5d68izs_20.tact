contract TestNestedTryCatch {
    receive() {
        // Nested try-catch: inner try-catch catches the throw, so outer try block completes normally
        try {
            try {
                throw(501);
            } catch (e) {
                dump(e); // expected output: 501
            }
            dump(100); // expected output: 100
        } catch (err) {
            dump(404); // should not be reached
        }
    }
}
