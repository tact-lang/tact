contract TestMultiple {
    fun multiReturn(flag: Bool) : Int {
        if (flag) {
            return 1;
        } else {
            return 2;
        }
    }
}
