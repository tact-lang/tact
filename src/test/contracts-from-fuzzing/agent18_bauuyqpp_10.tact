contract TestStringAsComment {
    fun showcase() {
        // Test calling an extension function on a string literal
        dump("hello".asComment());
    }
}
