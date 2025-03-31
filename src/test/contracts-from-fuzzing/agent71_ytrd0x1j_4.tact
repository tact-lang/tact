contract TestOptionalGetter {
    receive() {}

    // Getter returning an optional Int, using null literal
    get fun getOpt(): Int? {
         return null;
    }
}
