contract TestGetterConditional {
    get fun getValue(): Int {
        if (true) {
            return 1;
        } else {
            return 2;
        }
    }
}
