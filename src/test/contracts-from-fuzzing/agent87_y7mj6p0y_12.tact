contract TestNestedReturn {
    fun f(): Int {
        if (true) {
            if (false) {
                return 10;
            } else {
                return 20;
            }
        }
        return 30;
    }
}
