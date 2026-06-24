contract OptionalGetter {
    receive() {}

    get fun getOpt(): Int? {
        return null;
    }
}
