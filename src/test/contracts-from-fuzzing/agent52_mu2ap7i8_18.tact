contract TestOptionalGetter {
    // Optional state variable, explicitly initialized to null
    opt: Int? = null;

    receive() {}

    // Getter returning the optional value
    get fun getOptional(): Int? {
        return self.opt;
    }
}
