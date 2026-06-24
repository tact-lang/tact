contract GetterUnused {
    receive() {}

    get fun unusedGetter(): Int {
        return 999;
    }
}
