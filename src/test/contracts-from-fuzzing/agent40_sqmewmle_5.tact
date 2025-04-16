contract TryOnlyTest {
    receive() {
        try {
            throw(1042);
        }
        dump(1042);
    }
}
