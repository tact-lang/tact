contract TestThrowUnless {
    receive() {
        try {
            // since condition is false, throwUnless should throw exit code 123
            throwUnless(123, false);
            dump(0); // should be unreachable
        } catch (err) {
            dump(err); // should dump 123
        }
    }
}
