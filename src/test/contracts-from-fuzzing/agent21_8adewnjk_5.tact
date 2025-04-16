contract TestTryCatch {
    receive() {
        let result: Int = 0;
        try {
            throw(101);
        } catch (err) {
            result = err;
        }
        dump(result);
    }
}
