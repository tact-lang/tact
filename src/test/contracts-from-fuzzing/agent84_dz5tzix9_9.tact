contract Test8 {
    opt: Int? = null;

    receive() {}

    get fun getDefault(): Int? {
        return self.opt;
    }
}
