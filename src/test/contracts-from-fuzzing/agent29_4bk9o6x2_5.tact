contract TestContract {
    receive() {
        // try...catch with catch block
        try {
            throw(101);
        } catch (err) {
            dump(err);
        }
    }
}
