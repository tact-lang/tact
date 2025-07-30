contract ReturnTest3 {
    fun nestedBlock(): Int {
        {
            return 100;
        }
        // Unreachable code
    }

    receive () {}
}
