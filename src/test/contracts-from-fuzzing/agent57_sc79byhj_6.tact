contract TryNoErrorTest {
    receive() {
        try {
            dump(100);
        }
        // No catch block
        dump(200);
    }
}
