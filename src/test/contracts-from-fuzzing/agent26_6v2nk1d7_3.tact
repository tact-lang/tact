contract TestNestedReturn {
    fun nested(): Int {
        { if (2 + 2 == 4) { return 100; } }
        return 0;
    }
    receive() {}
}
