contract TestReturnOptional {
    // Getter function returning an optional Int
    get fun test(): Int? {
        if (true) {
            return 42;
        } else {
            return null;
        }
    }

    receive () {}
}
