contract NestedReturn {
    fun inner() : Int {
        {
            if (true) {
                return 42;
            }
        }
        return 0;
    }

    receive() {}
}
