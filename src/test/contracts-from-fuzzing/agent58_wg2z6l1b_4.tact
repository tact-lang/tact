contract TestOptional {
    y: Int? = null;

    receive() {}

    get fun getOptional(): Int? {
        return self.y;
    }
}
