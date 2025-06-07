contract TestOptionalLet {
    receive() {
        let optValue: Int? = null;
        dump(optValue);
    }
}
