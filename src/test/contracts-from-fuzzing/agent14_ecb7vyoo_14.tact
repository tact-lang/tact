contract TestThrowIf {
    receive() {
        // Should not throw because condition is false
        throwIf(1042, false);
        dump(1);

        // Should throw because condition is true, caught by try-catch
        try {
            throwIf(1042, true);
        } catch (err) {
            dump(err);
        }
    }
}
