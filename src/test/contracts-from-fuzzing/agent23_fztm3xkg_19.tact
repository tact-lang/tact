contract TestThrowIf {
    receive() {
        // Using throwIf: this should throw if condition is true
        throwIf(550, true);
        dump(0); // this line should not be reached
        return;
    }
}
