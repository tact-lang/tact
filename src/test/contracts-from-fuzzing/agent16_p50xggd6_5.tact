contract TestGetter {
    v: Int = 0;

    get fun test(ret: Bool): Int {
        if (ret) {
            return 1;
        } else {
            return 2;
        }
    }
}
