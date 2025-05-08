contract StringOpt {
    s: String? = null;

    get fun getStr(): String? {
        return self.s;
    }
}