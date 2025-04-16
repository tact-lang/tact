contract TestTryCatchValid {
    init() {}
    receive() {
        try {
            throw(101);
        } catch (err) {
            dump(err); // expected to output 101
        }
    }
}
