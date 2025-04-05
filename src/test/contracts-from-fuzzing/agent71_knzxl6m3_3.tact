contract TryCatchTest {
    receive() {
        try {
            throw(101);
        } catch (err) {
            dump(err);
        }
    }
}
