contract TryCatchTest {
    receive() {
        try {
            throw(777);
        } catch (code) {
            dump(code); // expected output: 777
        }
        cashback(sender());
    }
}
