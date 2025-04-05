contract TestNestedTryCatch {
    receive() {
        // Nested try-catch
        try {
            try {
                throw(200);
            } catch (inner) {
                dump(inner);
            }
        } catch (outer) {
            dump(outer);
        }
    }
}
