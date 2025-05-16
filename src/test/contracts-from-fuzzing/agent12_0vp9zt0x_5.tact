contract OptionalGetter {
    receive() {}

    get fun getMaybeInt() : Int? {
        return null;
    }
}
