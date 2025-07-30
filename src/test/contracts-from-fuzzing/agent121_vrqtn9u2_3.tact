contract TestNestedReturn {
    fun test(): Int {
        { 
            if (true) {
                return 42;
            }
        }
        return 0;
    }
}
