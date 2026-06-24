contract TestConst {
    const VAL: Int = 10;

    get fun add(x: Int): Int {
        return self.VAL + x;
    }
}
