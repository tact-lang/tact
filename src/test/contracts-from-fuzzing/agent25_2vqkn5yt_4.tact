contract ReturnNestedBlock {
    // Function with a nested block that contains a conditional return
    fun nestedReturn(val_: Int): Int {
        {
            if (val_ < 0) {
                return -1;
            }
        }
        return val_;
    }

    receive () {}
}
