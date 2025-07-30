contract TryCatchTest {
    receive() {
        try {
            throw(1042);
        } catch (err) {
            // Expecting to catch exit code 1042
            dump(err);
        }
    }
}
