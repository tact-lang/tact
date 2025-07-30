contract TestOptional {
    v: Int? = null;

    receive() {}

    get fun getV(): Int? {
        return self.v;
    }
}
