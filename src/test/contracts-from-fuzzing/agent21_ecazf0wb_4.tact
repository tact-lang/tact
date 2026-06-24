contract Test {
    fun nestedBlockReturn(): Int {
        { if(true) { return 7; } }
        return 0;
    }
}
