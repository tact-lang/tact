contract TryCatchTest {
    receive() {
        try {
            throw(101);
        } catch (e) {
            dump(e); // Expected output: 101
        }
    }
}
