contract TestOptional {
    receive() {}

    get fun getNull(): Int? {
        return null;
    }
}
