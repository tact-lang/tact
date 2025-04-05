contract TryNoCatchTest {
    receive() {
        try {
            dump(1);
        }
        dump(2);
    }
}
