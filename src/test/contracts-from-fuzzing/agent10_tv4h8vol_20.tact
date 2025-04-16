contract TestThrowIfTrue {
    receive() {
        try {
            throwIf(42, true);
            dump(1); // this should be unreachable
        } catch (err) {
            dump(err); // expected to catch 42
        }
    }
}
