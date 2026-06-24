contract Test {
    receive() {
        // Attempt to call dump() with the result of dump(123)
        // dump(123) prints 123 and returns void, so passing it to dump should be invalid.
        dump(dump(123));
    }
}
