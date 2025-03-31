contract TestOptional {
    fun test(): Int? {
        if (10 > 5) {
            return 100;
        } else {
            return null;
        }
    }
}
